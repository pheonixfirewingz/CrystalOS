#include "MutliBoot.h"
/* Hardware text mode color constants. */
unsigned int strlen(const char *str)
{
	unsigned int len = 0;
	while (str[len])
		len++;
	return len;
}

int memset(void *s, int c, unsigned int n)
{
	char *p = (char *)s;
	while (n-- > 0)
		*p++ = c;
	return 0;
}

const unsigned int VGA_WIDTH = 80;
const unsigned int VGA_HEIGHT = 25;
const unsigned char terminal_color = 15 | 0 << 4;

unsigned int terminal_row = 0;
unsigned int terminal_column = 0;
unsigned short *terminal_buffer = (unsigned short *)0xB8000;

void clear_screen(void)
{
	memset(terminal_buffer, ((unsigned short)' ' | (unsigned short)terminal_color << 8), VGA_WIDTH * VGA_HEIGHT * 2);
}

void terminal_initialize(void)
{
	clear_screen();
}

void terminal_putentryat(char c, unsigned char color, unsigned int x, unsigned int y)
{
	const unsigned int index = y * VGA_WIDTH + x;
	terminal_buffer[index] = ((unsigned short)c | (unsigned short)color << 8);
}

void terminal_putchar(char c)
{
	if (c == '\n')
	{
		terminal_column = 0;
		++terminal_row;
		return;
	}
	terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
	if (++terminal_column == VGA_WIDTH)
	{
		terminal_column = 0;
		if (++terminal_row == VGA_HEIGHT)
		{
			clear_screen();
			terminal_row = 0;
		}
	}
}

void terminal_write_string(const char *data)
{
	for (unsigned int i = 0; i < strlen(data); i++)
		terminal_putchar(data[i]);
}

void print(const char *str)
{
	terminal_write_string(str);
}

void println(const char *str)
{
	terminal_write_string(str);
	terminal_putchar('\n');
}

void to_hex_string(int number, char *hex_string)
{
	const char *hex_digits = "0123456789ABCDEF";
	int i;
	// Convert each nibble (4 bits) of the number to hexadecimal
	for (i = 7; i >= 0; --i)
	{
		int nibble = (number >> (i * 4)) & 0xF; // Extract the next nibble
		*hex_string++ = hex_digits[nibble];		// Map the nibble to its hexadecimal character
	}
	*hex_string = '\0'; // Null terminate the string
}

void print_hex(int number)
{
	char hex_string[9];
	to_hex_string(number, hex_string);
	print(hex_string);
	terminal_putchar('\n');
}

void print_bit(int number, char mask)
{
	int i = number & (1 << mask);
	if (i)
		terminal_putchar('1'); // Bit is on
	else
		terminal_putchar('0'); // Bit is off
	terminal_putchar('\n');
}

void print_binary(int number)
{
	int i;

	// Iterate through each bit of the integer
	for (i = sizeof(int) * 8 - 1; i >= 0; i--)
	{
		// Check if the i-th bit is on or off
		if (number & (1 << i))
			terminal_putchar('1'); // Bit is on
		else
			terminal_putchar('0'); // Bit is off

		// Add space for better readability, adjust as needed
		if (i % 4 == 0)
			terminal_putchar(' ');
	}
	terminal_putchar('\n');
}

void kernel_main(unsigned long addr)
{
	multiboot_info_t* info = (multiboot_info_t*)addr;
	terminal_initialize();
	println("Hello, World! 64-bit x86!");
	println("Multiboot information:");
	print("Flags: ");
	print_hex(info->flags);
	println("\n");
	print_hex(MULTIBOOT_INFO_ALIGN | MULTIBOOT_MEMORY_INFO);
	//print memory info of upper and lower bounds
	println("Memory Info:");
	print("Upper bound: ");
	int upper = info->mem_upper / 1024 / 1024;
	print_hex(upper);
	println(" MB");
	print("Lower bound: ");
	int lower = info->mem_lower / 1024 / 1024;
	print_hex(lower);
	println(" MB");
}
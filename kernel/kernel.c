#include <stdint.h>

#define VGA_ADDRESS 0xB8000
#define WHITE_ON_GREY 0x70

void print(const char* str, uint8_t color) {
    volatile char* vga = (volatile char*)VGA_ADDRESS;
    for (int i = 0; str[i] != '\0'; i++) {
        vga[i * 2] = str[i];
        vga[i * 2 + 1] = color;
    }
}

void kernel_main() {
    print("Welcome to Omnitrix OS", WHITE_ON_GREY);
}

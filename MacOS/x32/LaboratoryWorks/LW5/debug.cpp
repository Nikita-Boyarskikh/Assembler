#include <iostream>

extern "C" void __fastcall debug(int position, char letter, int count) {
    std::cerr << '[' << position << "] " << letter << " - " << count << std::endl;
}

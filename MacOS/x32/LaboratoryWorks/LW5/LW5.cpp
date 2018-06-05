#include <iostream>
#include <sstream>
#include <string>

extern "C" void __cdecl calcNumberOfLetters(int[], const char*, int);

#define LETTERS_LEN 255

int main(int argc, char *argv[]) {
    std::string line;
    std::stringstream text;

    while(std::getline(std::cin, line)) {
        text << line;
    }

    int letters[LETTERS_LEN];
    std::string str = text.str();
    calcNumberOfLetters(letters, str.c_str(), str.size());

    std::cout << "Number of letters in text:" << std::endl;
    for(int i = 0; i < LETTERS_LEN; i++) {
        if(letters[i] > 0) {
            std::cout << "\t'" << (char)i << "' = " << letters[i] << std::endl;
        }
    }

    return 0;
}

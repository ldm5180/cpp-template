#include <fstream>
#include <iostream>

int main(int argc, char **argv) {
  if (argc <= 1) {
    std::cerr << "Provide input file on command line." << std::endl;
    return 1;
  }

  std::ifstream in(argv[1]);
  std::string input{};

  std::getline(in, input);

  return {};
}

#include <iostream>
#include <fstream>
#include <string>
#include "ORB_SLAM3/src/ORBvoc.h"

int main(int argc, char** argv)
{
    if(argc != 3)
    {
        std::cerr << "Usage: " << argv[0] << " <input_txt_vocab> <output_bin_vocab>" << std::endl;
        return 1;
    }

    std::string inputFile = argv[1];
    std::string outputFile = argv[2];

    std::cout << "Loading ORB vocabulary from text file: " << inputFile << std::endl;
    ORB_SLAM3::ORBVocabulary voc;
    voc.loadFromTextFile(inputFile);

    std::cout << "Saving ORB vocabulary to binary file: " << outputFile << std::endl;
    voc.saveToBinaryFile(outputFile);

    std::cout << "Conversion complete!" << std::endl;
    return 0;
}

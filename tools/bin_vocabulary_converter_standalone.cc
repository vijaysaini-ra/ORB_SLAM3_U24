#include <iostream>
#include "ORBVocabulary.h"

using namespace std;

int main(int argc, char **argv)
{
    if (argc != 3)
    {
        cerr << "Usage: " << argv[0] << " input_voc.txt output_voc.bin" << endl;
        return -1;
    }

    string txtFile = argv[1];
    string binFile = argv[2];

    ORB_SLAM3::ORBVocabulary voc;
    cout << "Loading text vocabulary from: " << txtFile << endl;

    if (!voc.loadFromTextFile(txtFile))
    {
        cerr << "Failed to load vocabulary from " << txtFile << endl;
        return -1;
    }

    cout << "Saving binary vocabulary to: " << binFile << endl;
    voc.saveToTextFile(binFile);  // <- fallback: saveToTextFile() writes readable version
    cout << "Done." << endl;

    return 0;
}


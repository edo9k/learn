#include <fstream>
#include <iostream>

#define SIZE 256
#define FILE_NAME "stream-example.dat" 

using namespace std;

int main() {
  char data[SIZE];

  ofstream outfile;
  outfile.open(FILE_NAME);

  cout << "-- file stream example --" << endl;
  cout << "Enter your name: ";
  cin.getline(data, SIZE);

  // write name to file
  outfile << data << endl;

  cout << "Enter your age: ";
  cin >> data;
  cin.ignore();

  // write age to file
  outfile << data << endl;

  // close file
  outfile.close();

  // open file in read mode
  ifstream infile;
  infile.open(FILE_NAME);

  cout << "-- reading from the file --" << endl;
  infile >> data;

  // first read
  cout << data << endl;

  // second read
  infile >> data;
  cout << data << endl;

  // close file
  infile.close();

  return 0;
}


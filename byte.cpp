// Source: http://www.nuonsoft.com/blog/2018/06/03/c17-stdbyte/
#include <iostream>
#include <cstddef>

using namespace std;

void PrintByte(const byte& aByte)
{
    cout << to_integer<int>(aByte) << endl;
}

int main()
{
    if(true ){
    byte myByte{ 2 };
    PrintByte(myByte);	// 2

    // A 2-bit left shift
    myByte <<= 2;
    PrintByte(myByte);	// 8

    // Initialize two new bytes using binary literals.
    byte byte1{ 0b0011 };
    byte byte2{ 0b1010 };
    PrintByte(byte1);	// 3
    PrintByte(byte2);	// 10

    // Bit-wise OR and AND operations
    byte byteOr = byte1 | byte2;
    byte byteAnd = byte1 & byte2;
    PrintByte(byteOr);	// 11
    PrintByte(byteAnd);	// 2
    }
}

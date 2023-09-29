#include <algorithm>
#include <boost/lambda/lambda.hpp>
#include <iostream>
#include <vector>

int main()
{
  std::vector v{3, 2, 4};
  std::for_each(v.begin(), v.end(), std::cout << boost::lambda::_1 << '\n');
}


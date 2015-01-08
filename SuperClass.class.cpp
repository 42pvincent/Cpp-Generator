
#include "SuperClass.class.hpp"

SuperClass::SuperClass(void)
{
	return ;
}

SuperClass::SuperClass(SuperClass const & src)
{
	*this = src;

	return ;
}

SuperClass::~SuperClass(void)
{
	return ;
}

SuperClass &
SuperClass::operator=(SuperClass const & rhs)
{
	if (this != &rhs)
	{
			//// PUT VALUE HERE
			//// this-> val = rhs.getVal();
	}
	return (*this);
}

std::ostream&
operator<<(std::ostream &o, SuperClass const &i)
{
	o << "Class : SuperClass" << std::endl;
	(void)i;
	return (o);
}

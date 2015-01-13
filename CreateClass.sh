if [ $1 ]; then
class=$1
CLASS=`echo "$class" | tr '[:lower:]' '[:upper:]'`
CLASS+="_HPP"
hppname=$class
hppname+=".hpp"
touch $hppname
echo "
#ifndef		$CLASS
# define	$CLASS

# include <iostream>

class $class
{
public:
	$class(void);
	$class($class const &src);
	~$class(void);

	$class				&operator=($class const &rhs);

private:
};

std::ostream				&operator<<(std::ostream &o, $class const &i);

#endif" > $hppname

cppname=$class
cppname+=".cpp"
touch $cppname
echo "
#include \"$hppname\"

$class::$class(void)
{
	return ;
}

$class::$class($class const &src)
{
	*this = src;
	return ;
}

$class::~$class(void)
{
	return ;
}

$class
&$class::operator=($class const &rhs)
{
	if (this != &rhs)
	{
		// PUT VALUE HERE
		// this-> val = rhs.getVal();
	}
	return (*this);
}

std::ostream
&operator<<(std::ostream &o, $class const &i)
{
	o	<< \"Class : $class\" << std::endl;
	(void)i;
	return (o);
}" > $cppname

else
echo "I need a class name"
fi

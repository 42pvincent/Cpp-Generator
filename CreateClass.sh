if [ $1 == "Quake3" ]; then
git clone http://github.com/ioquake/ioq3.git quake3-tmp
sh quake3-tmp/make-macosx.sh x86_64
mkdir ioquake3
mv quake3-tmp/build/release-darwin-x86_64/ ./ioquake3/
curl -o quake3-tmp/baseq3.zip "http://wingu.trektawimbi.fr/public.php?service=files&t=a234fc4f4f4d4b7882c0ef3316d56a6e&download"
unzip quake3-tmp/baseq3.zip -d quake3-tmp/
mv ioquake3/release-darwin-x86_64/* ioquake3/
rm -rf ioquake3/baseq3
mv quake3-tmp/baseq3 ./ioquake3/
rm -rf quake3-tmp
fi

if [ $1 ] && [ $1 != "Quake3" ] ; then
class=$1
CLASS=`echo "$class" | tr '[:lower:]' '[:upper:]'`
CLASS+="_CLASS_HPP"
hppname=$class
hppname+=".class.hpp"
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
cppname+=".class.cpp"
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
			//// PUT VALUE HERE
			//// this-> val = rhs.getVal();
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

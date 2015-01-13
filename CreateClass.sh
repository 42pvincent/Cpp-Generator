if [ $1 == "Quake3" ]; then
mkdir ~/Games/
git clone http://github.com/gundz/ioq3.git ~/Games/quake3-tmp
sh ~/Games/quake3-tmp/make-macosx.sh x86_64
mkdir ~/Games/ioquake3
mv ~/Games/quake3-tmp/build/release-darwin-x86_64/ ~/Games/ioquake3/
curl -o ~/Games/quake3-tmp/baseq3.zip "http://wingu.trektawimbi.fr/public.php?service=files&t=f5049d975dd970ded94629228e640f26&download"
unzip ~/Games/quake3-tmp/baseq3.zip -d ~/Games/quake3-tmp/
mv ~/Games/ioquake3/release-darwin-x86_64/* ~/Games/ioquake3/
rm -rf ~/Games/ioquake3/baseq3
mv ~/Games/quake3-tmp/baseq3 ~/Games/ioquake3/
rm -rf ~/Games/quake3-tmp
if [ !$2 ]; then
~/Games/ioquake3/ioquake3.x86_64
fi
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

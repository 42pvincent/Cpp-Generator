class=$1
type=$2
name=$3
if [ $1 ] && [ $2 ] && [ $3 ]; then
echo "" >> $class.class.cpp
echo $2 >> $class.class.cpp
echo "$class::get$name(void) const
{
	return (this->_$name);
}" >> $class.class.cpp

echo "" >> $class.class.cpp
echo "void" >> $class.class.cpp
echo "$class::set$name($type const $name)
{
	this->_$name = $name;
	return ;
}" >> $class.class.cpp

sed -i '.tmp' $'/private:/ i\
\\\t\t'"$2 "'get'"$3"'(void)'" const;
" $1.class.hpp
sed -i '.tmp' $'/private:/ i\
\\\t\t'"void "'set'"$3($2 const $3);\\
\\
"  $1.class.hpp
sed -i '.tmp' $'/private:/ a\
\\\t\t'"$2"$'\\\t'"_$3;\\
\\
"  $1.class.hpp

rm -rf $1.class.hpp.tmp

else
	echo "I need a ClassName, a Type and a Name"
fi

class=$1
type=$2
name=$3

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

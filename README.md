# CreateClass

Create a new class
Call it with the Class name you want, and let him do the work.

Call it with :
  - Class name

Example :
./CreateClass.sh Foo

# GetSet

Create a new getter and setter.
Call it with :
  - Class name
  - Var type
  - Var name

Example :
./getset.sh FooClass int bar 


Give :
  - in FooClass.class.cpp

  ```c++
  int
  FooClass::getbar(void) const
  {
  	return (this->_bar);
  }
  
  void
  FooClass::setbar(int const bar)
  {
  	this->_bar = bar;
  	return ;
  }
  ```
  - in FooClass.class.hpp

  ```c++
  int getbar(void) const;
  void setbar(int const bar);
```
# Private

Create a new private var in the class you want then do the same than getset.sh

Call it with :
  - Class name
  - Var type
  - Var name


Example :
./private.sh FooClass int bar

Give :
  - in FooClass.class.cpp

  ```c++
  int
  FooClass::getbar(void) const
  {
  	return (this->_bar);
  }
  
  void
  FooClass::setbar(int const bar)
  {
  	this->_bar = bar;
  	return ;
  }
  ```
  - in FooClass.class.hpp

  ```c++
  int getbar(void) const;
  void setbar(int const bar);
  
  private:
    int    _bar;
```


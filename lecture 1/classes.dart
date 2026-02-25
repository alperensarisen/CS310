class Student
{
  
  String name;
  String id;
  int age;
  Student(this.name, this.id, this.age);
  void info(){
    print("Name : $name | id: $id | Age: $age");
  }
}
class Animal  //! super class
{
  String type;
  Animal(this.type);
  void makeSound(){print("Making Sound!");}
}
class Cat extends Animal{
  String name;
  Cat(this.name, super.type);
  @override
  void makeSound(){
    print("Meow!");
  }
}
void main(){
  var student1 = Student("Alperen", "1231", 21);
  student1.info();
  Cat cat = Cat("cat1", "Type1");
  cat.makeSound();
}
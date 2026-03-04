class Student{
  String name;
  String id;
  Student(this.name, this.id);
  @override
  String toString() => "$name : $id";
//? If we do not add this function as override we will see
//? Printing List Students : [Instance of 'Student', Instance of 'Student']
//? as output.
}
class Collection<T>{
  String name;
  List<T> data;
  Collection(this.name, this.data);
  
 
  void prettyPrint()=>print("Printing List $name : $data");
  
}
//!Named Function
void sayHello(String name) => print("Hello, $name!");

void printMap(String key, int value) => print("$key : $value");
void main(){
  var collection = Collection<Student>("Students",[
    Student("Ali","101"),
    Student("Alp", "122"),
    Student("Arda", "123")
    ]);
  collection.prettyPrint();
//!Anonymous function
  var greet = (String name) => print("Hi, $name!");
  greet("Alperen");
  sayHello("Alperen");
  
  var grades = {
    "Alperen" : 50,
    "Hamza" : 49,
    "Arda" : 30
  };
  grades.forEach((String key, int value) => print("$key : $value"));
  grades.forEach(printMap);

}
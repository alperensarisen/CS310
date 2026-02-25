import 'dart:io';
import 'dart:math';
void main(){
  
  greet("Victor");
  //bio();  //even if there are parameters we defined them as they can be null
  print(square(2.1));
  List<String> names = ["a", "b", "c"];
  List<int> numbers = [1 ,2 ,3];
  var mixed = [1, "A", 1.2];  //! It is possible but not recommend to use
  print(mixed);
}
void greet(String name){
  print("Hello! $name");
 
  
}
void bio({required String name, int? age}){
  print("Name: $name, Age: $age");
}
double square(double x) => x*x;
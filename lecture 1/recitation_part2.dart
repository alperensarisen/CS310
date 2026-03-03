//import 'dart:io';
//import 'dart:math';
void main(){
  
  greet("Victor");
  //bio();  //even if there are parameters we defined them as they can be null
  print(square(2.1));

  List<String> names = ["a", "b", "c"];
  List<int> numbers = [1 ,2 ,3];
  var mixed = [1, "A", 1.2];  //! It is possible but not recommend to use
  print(numbers);
  print(mixed);

  print("Element in first index of name list is: $names[1]");
  names.add("Ahmet");
  print(names);
  names.addAll(["Alperen", "Arda"]);
  print(names);
  names.remove("Alperen"); //! it will remove first instance
  //names.removeLast("Arda"); //! to delete last occurence
  names.removeAt(1); //! delete element with index
  print("Modified version of names list $names");
  
  for(int i = 0; i<names.length ; i++){
    print(names[i]);
  }
  for(var name in names){
    print(name);
  }
  names.forEach((name) => print(name));
  //Set<String> set_names = {"Ali", "Ahmet", "Arda", "Ali"}; //? set ignores repeated elements
  //print(set_names);
}
void greet(String name){
  print("Hello! $name");
 
  
}
void bio({required String name, int? age}){
  print("Name: $name, Age: $age");
}
double square(double x) => x*x;
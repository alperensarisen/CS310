//Named function
void sayHello(String name) => print("Hello $name!");
//Anonymous function
var greet = (String name) => print("Hi, $name!");

void printResult(String name, int score){
  String status = score >= 50 ? "PASSED" : "FAILED";
  print("Name: $name, Score: $score, Status: $status");
  print("--------------------");
}
void main(){
  var numbers = [1, 2, 3];
  for(var num in numbers){
    print(num * 2);
  }

  numbers.forEach((num) => print(num*3));
//! MAP ITERATION
  var grades = {"Alice" : "A", "Bob" : "B"};
  grades.forEach((name , grade) => print("$name, $grade"));
  /*
  PRACTICE — STUDENT PASS / FAIL REPORT
  Create a named function that takes a student name and their score, then prints the name, score, and whether they passed (≥
  50) or failed.
  In main , create a Map<String, int> of student names to their scores and use forEach to pass your function.
  How would you do this with lambda functions? 
  */
  Map<String, int> students = {
    "bob" : 60,
    "jack" : 70,
    "david" : 30,
    "alp" : 49
  };
  students.forEach(printResult);
}
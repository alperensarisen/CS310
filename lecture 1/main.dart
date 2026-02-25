void main(){
  int qty = 2; 
  double price = 4.2;
  print("Total: ${qty * price}");


  String? value; // string can be null or a string
  print(value);
  value ??= "Victor"; //assign victor if the String variable is null
  var _value = DateTime.now();    // if we dont know type of upcoming input, then var is the best choice 
  print(_value);

  final birthyear = 2001;
//? final statement can work in runtime, therefore we can assign somethin like
//? DateTime.Now() but for const it is not possible since it does not work in runtime 
  const double pi = 3.14; // compile time
  print(pi);
  print(birthyear);
  //birthyear = 2000;  //! Not possible
  //const var = DateTime.now(); //! Not possible since DateTime works in runtime
  double gpa = 3.2;
  String x = gpa > 3 ? "Yes" : "No";  //! Ternary statements
  print(x); 
}
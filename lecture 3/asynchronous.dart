//! Asynchronous Programming
//? Why Async?
//* Handle operations that take time (e.g., network requests, file reading).
 Future<String> fetchData(){
  return Future.delayed(Duration(seconds: 2), () => "Data loaded!");
 }
/*
 void main(){
  print("Fetching...");
  fetchData().then((data) => print(data));
  print("waiting...");
 }
 */

//? ASYNC/AWAIT: CLEANER SYNTAX FOR FUTURES
/*
void main() async {
  print("Fetching...");
  final data = await fetchData();
  print(data);
  print("Done!");
}
*/
Future<String> fetchDataWithError() {
  return Future.delayed(Duration(seconds: 1), () => throw "Network error!");
}
//! Error Handling in Async
void main() async{
  try{
    var data = await fetchDataWithError();
    print(data);
  }
  catch(e){
    print("Caught: $e"); 
  }
}
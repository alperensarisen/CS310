//! example of higher order function
List<String> transformList(List<String> items, String Function(String) transformer){
  return items.map(transformer).toList();
}
// Closure logic
Function makeCounter(){
  int count = 0;
  return () => count++;
}
void main(){
  var usernames = ["alice", "bob", "charlie"];
  var uppercased = transformList(usernames, (name) => name.toUpperCase());
  print(uppercased);

  var counter = makeCounter();
  print(counter());
  print(counter());
  //! it is increasing since closure capture and memorize it
}

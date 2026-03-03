//? similar logic with templates
class Collection<T>{
  String name;
  List<T> data;

  Collection(this.name, this.data);
  T randomItem(){
    data.shuffle();
    return data[0];
  }
}
/*
void main(){
  var numbers = Collection<int>("Numbers", [1, 2, 3 ,4 ,5]);
  int r_number = numbers.randomItem();
  print(r_number);

  var words = Collection<String>("words", ["hello", "world", "goodbye"]);
  String r_word = words.randomItem();
  print(r_word);
}
*/
class User{
  String username;
  int pass;
  User(this.username, this.pass);
  void displayProfile(){
    print("##### Profile #####");
    print("Name: $username, Pass: $pass");
  }
}
void main(){
  var user1 = User("Alperen", 1231);
  user1.displayProfile();
}
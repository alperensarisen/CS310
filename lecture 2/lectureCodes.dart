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
Function makeLoginCounter(){
  int count = 0;
  return (){
    //Login logic goes here!
    print("Logging in...");
    count++;
    return count;
  }; //Captures count
}
class Post{
  String username;
  String content;
  Post(this.username, this.content);
  @override
  String toString() => "$username: $content";
}
List<Post> filterPost(List<Post> posts, bool Function(Post) filterFunc){
  List<Post> filtered = [];
  for(var post in posts){
    if(filterFunc(post)){
      filtered.add(post);
    }
  } 
  return filtered;
}
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


  var counter = makeLoginCounter();
  print(counter());
  print(counter());
  print(counter());


  var posts = [
    Post("alice", "Loving dart"),
    Post("bob", "Hello world!"),
    Post("hank", "Async coding"),
    Post("david", "Goodbye!")
  ];
  var filtered = filterPost(posts, (Post post) =>post.username == "alice" || post.username == "bob");
  print(filtered);
}
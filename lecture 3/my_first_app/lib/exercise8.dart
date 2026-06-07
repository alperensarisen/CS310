import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class User{
  final String name;
  final String email;
  User({required this.name, required this.email});
  factory User.fromJson(Map<String,dynamic> json){
    return User(name: json["name"], email: json["email"]);
  }
  Map<String,dynamic> toJson() =>{
    
    'name' : name,
    'email' : email
  };
}
class UserService{
  
  static Future<List<User>> fetchUsers() async{
    final URL = Uri.https('jsonplaceholder.typicode.com','/users');
    final res = await http.get(URL);
    if(res.statusCode == 200){
      List<dynamic> jsonList = jsonDecode(res.body);
      return jsonList.map((i) => User.fromJson(i)).toList();
    }
    else{
      throw Exception("ERROR HAS OCCURED");
    }
  }
}

void getUrlInfo() async{
  final URL = Uri.https('jsonplaceholder.typicode.com','/users');
  final response = await http.get(URL);
  if(response.statusCode != 200){
    print("Failed");
    return;
  }
  print(response.body);
}
void main() {
 //getUrlInfo();
  runApp(MaterialApp(home:app()));
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: UserService.fetchUsers(), 
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child:CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            return Center(child:Text("There is an error"));
          }
          else if(snapshot.hasData){
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index){
                final userData = users[index];
                return ListTile(
                  leading: CircleAvatar(child: Text("${index+1}")),
                  title: Text(userData.name),
                  subtitle: Text(userData.email),
                );
              }
              );
          }
          return const Center(child:Text("Data can not be found"));
        },
      ),
    );
  }
}
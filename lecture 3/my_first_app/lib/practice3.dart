import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(const MaterialApp(home: MyApp()));
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          width: 250,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4),
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NAME",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      Text("namesurname@gmail.com", style: TextStyle(fontSize: 7, color: Color.fromARGB(124, 0, 0, 0)))
                      ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NAME",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      Text("namesurname@gmail.com", style: TextStyle(fontSize: 7, color: Color.fromARGB(124, 0, 0, 0)))
                      ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NAME",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      Text("namesurname@gmail.com", style: TextStyle(fontSize: 7, color: Color.fromARGB(124, 0, 0, 0)))
                      ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ), //style
              
              child: Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 5,),
                  Text("Add Favorite")
                ],
                )
              ),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: () {SystemNavigator.pop();},  //This method only works in Anroid, it is not recommended for ios
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 5),
                  Text("EXIT")
                ],
              ))
            ],
          ),
        ),
      )
    );
  }
}
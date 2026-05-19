import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: homePage()));
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}
class Student{
  
  final String name;
  final String id;
  Student({required this.name, required this.id});
}
class _homePageState extends State<homePage> {
  List<Student> students =[
    Student(name: "Alperen", id: "1111"),
    Student(name: "Ataberk", id: "2222")
  ];
  final _formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  String s_name = "";
  String s_id = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Student Name",
                      border: OutlineInputBorder() 
                    ),
                    validator: (value) {
                      if(value == null || value!.isEmpty){
                        return "Enter a valid name";
                      }
                        
                      return null;
                    },
                    onSaved: (value) => s_name = value!,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      border: OutlineInputBorder() 
                    ),
                    validator: (value) {
                      if(value == null || value!.length != 4) {
                        return "Enter a valid ID (xxxx)";
                      }
                      return null;
                    },
                    onSaved: (value) => s_id = value!,
                  ),
                  ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()){
                      _formkey.currentState!.save();
                      setState(() {
                        students = [...students, Student(name: s_name, id: s_id)];
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: 
                        Text('Student $s_name saved with id $s_id'),
                        backgroundColor: Colors.teal,)
                      );
                    }
                  }, child: Text("Save")),
                  ElevatedButton(onPressed: (){

                    
                  }, child: Text("List Students"))
                  ],
              )),
              SizedBox(height: 10,),
              Expanded(child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (BuildContext context, int index) {
                        final s = students[index];
                        
                        return ListTile(
                          leading: Icon(Icons.person),
                          title: Text(s.name),
                          subtitle: Text(s.id),
                          trailing: IconButton(onPressed: (){setState(() {
                            students = students.where((s) => students[index]!=s).toList();
                          });}, icon: Icon(Icons.delete)),
                        );
                      },
                    ))
          ],
        )
      ),
    );
  }
}
/*
ListView.builder(
          itemCount: students.length,
          itemBuilder: (BuildContext context, int index) {
            final s = students[index];
            return InkWell(
              onTap: () {
                print("Hello, ${s.name}");
              },
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(s.name),
                subtitle: Text(s.id),
              ),
            );
          },
        ),
 */
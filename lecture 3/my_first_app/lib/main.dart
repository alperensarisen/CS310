import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  @override
  void initState(){
    loadData();
    super.initState();
  }
  void saveData() async{
    final pref = await SharedPreferences.getInstance();
    await pref.setString('name', _controller.text);
    setState(() {
      username = _controller.text;
    });
  }
  void loadData() async{
    final pref = await SharedPreferences.getInstance();
    setState((){
      if(pref.getString('name') == null){
        username = 'No named saved';
      }
      else{
        username = pref.getString('name');
      }
    }
    );
  }
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(username!),),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              label: Text("Enter Username"),
              border: OutlineInputBorder(),
              suffix: IconButton(onPressed: (){_controller.clear();}, icon: Icon(Icons.clear)),
            ),
            
          ),
          ElevatedButton(onPressed: (){saveData();}, child: Text("Save"))
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MaterialApp(home: homePage(),));
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final _contorller = TextEditingController();
  List<String> names = ["alperen", "egemen"];
  @override
  void initState(){
    loadData();
    super.initState();
  }

  void saveData()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('data', [...names, _contorller.text]);
    setState(() {
      names = [...names, _contorller.text];
    });
  }
  void loadData() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      names = prefs.getStringList('data') ?? [];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _contorller,
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(),
                suffix: IconButton(onPressed: (){_contorller.clear();}, icon: Icon(Icons.clear))
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){saveData();}, child: Text("Add")),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index){
                  final name = names[index];
                  return ListTile(
                    leading: Icon(Icons.save),
                    title: Text(name),
                  );
                }),
            )
          ],
        ),
      ),
    );
  }
}
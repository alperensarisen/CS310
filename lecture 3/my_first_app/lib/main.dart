import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage()));
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String _enteredName = '';
  String ?_feedback;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter your feedback here...",
                border: OutlineInputBorder(),
                suffix: IconButton(onPressed: (){_controller.clear();}, icon: Icon(Icons.clear))
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            setState(() {
              _feedback = _controller.text;
            });
          }, child: Text("SUBMIT")),
          _feedback == null ? Text("There is no any feedback") : Text(_feedback!, style: TextStyle(fontSize: 50),),
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Your Name",
                    border:  OutlineInputBorder()
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty)
                      return "Name is required";
                    return null;
                  },
                  onSaved: (value) => _enteredName = value!,
                ),
                ElevatedButton(onPressed: (){
                  if(_formkey.currentState!.validate()){
                    _formkey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: 
                        Text('Hello $_enteredName'),
                        backgroundColor: Colors.teal,)
                      );
                  }
                }, 
                child: Text("Submit"))
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: CoffeOrder()));
class CoffeOrder extends StatefulWidget {
  const CoffeOrder({super.key});
 
  @override
  State<CoffeOrder> createState() => _CoffeOrderState();
}

class _CoffeOrderState extends State<CoffeOrder> {
  final _formkey = GlobalKey<FormState>();
   String name = "";
  String drink ="";
  String phone ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coffe Order", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),backgroundColor: Colors.brown,),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Your Name",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return "Name is required";
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Drink",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  String drinkName = value?.toLowerCase().trim() ?? "";

                  if (drinkName != "latte" && drinkName != "iced americano") {
                    return "There is no such a drink";
                  }
                  return null;
                },
                onSaved: (value) => drink = value!,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone (+90)",
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if(value!.length <= 11 || value.isEmpty)
                    return "Please enter valid phone 0xxx xxx xx xx";
                  return null;
                },
                onSaved: (value) => phone = value!,
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  _formkey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: 
                        Text('Hello $name, your $drink order is being prepared!'),
                        backgroundColor: Colors.teal,)
                      );
                }
              }, 
              child: Text("Order")
              )
            ],
          )),
      ),
    );
  }
}
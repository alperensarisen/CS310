//! Some cmd codes for flutter:
//?   flutter --version -> Make sure flutter SDK is installed and added to your system PATH.
//?   flutter create my_first_app -> to create new flutter project
//?   then when we are in the project file by using "flutter run -d chrome" command
//?   we can see our app in chrome
//&   also by using "flutter devices" you can see possible devices you can use to your app


//! CORE WIDGETS
//* Text("Hello World!", style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 21, 0, 255))
//* Image.network('https://...')
//* ElevatedButton(onPressed: (){}, child: Text('Click me!'))
//* Icon(Icon.star, color: Colors.amber, size: 40)

//! Scaffold & Layout Widgets
//* Scaffold: App skeleton
//* Container: Styling box
//* Column: Vertical layout
//* Row: horizontal layout

//& Some other core widgets
//* appBar: Top bar with title, back button, or actions.
//* body: The main content area.
//* floatingActionButton: A button that floats above the UI
//* drawer: A slide-out side menu.
//* bottomNavigationBar: Tab bar at the bottom.


import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    //! FIRST PARCTICE
    /*MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,    // Contorls vertical alignment (e.g, start, center, spaceBetween)
          crossAxisAlignment:  CrossAxisAlignment.start,  // Control horizontal alignment (e.g, start, center ,stretch)
          children: [                                     // List of widgets to display
            Text("Item 1"),
            Text("Item 2"),
            Text("Item 3"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star, color: Colors.amber),
                ElevatedButton(onPressed: (){print("Button pressed! ");}, child: Text("Get Started")),
                Icon(Icons.star, color: Colors.amber,) 
                ]
            )
          ],
        )
      ),
    );*/
    //! SECOND PRACTICE
    /*
    MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          backgroundColor: Colors.deepPurple,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello!", style: TextStyle(fontSize: 24),),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: Text('Tap me')),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){ print("FAB Pressed!");},
        child: Icon(Icons.add)
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]
        ),
      )
    );
    */
    //! EXERCISE
    //TODO: Add an AppBar with title "My Profile"
    //TODO: Add a body with centered text showing your name
    //TODO: Adda a FloatingActionButton with a star icon 
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          backgroundColor: Colors.deepPurple
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Alperen", style: TextStyle(fontSize: 24),)
            ],
        ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.star),
        ),
      ),
    );
  }
}
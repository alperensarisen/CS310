import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main() => runApp(const MaterialApp(home: ScoreBoard()));
class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key});

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int score_1 = 0; 
  int score_2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("$score_1", style: TextStyle(fontSize: 50, color: Colors.blue, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){setState(() {score_1++;});}, 
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade400, foregroundColor: Colors.white),
                      child: Icon(Icons.plus_one)
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: (){setState(() {score_1--;});}, 
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade400, foregroundColor: Colors.white),
                      child: Icon(Icons.remove)
                    )
                  ],
                )
                
                ],
            ),
          ),
         Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ]
              ),
            child: Column(  
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Text("$score_2", style: TextStyle(fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){setState(() {score_2++;});}, 
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400, foregroundColor: Colors.white),
                      child: Icon(Icons.plus_one),
                     
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: (){setState(() {score_2--;});}, 
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400, foregroundColor: Colors.white),
                      child: Icon(Icons.remove),
                    )
                  ],
                )
                
                ],
            ),
          )

        ],
      ),
    )
    );
  }
}
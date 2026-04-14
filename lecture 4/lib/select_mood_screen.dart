import 'package:flutter/material.dart';
import 'package:my_first_app/submission_screen.dart';

List<String> moodHistory = [];
class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedMood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Tracker", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 93, 15, 107),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("How are you feeling today?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){setState(() {
                  selectedMood = "Happy";
                });}, child: Text("☺️")),
                ElevatedButton(onPressed: (){setState(() {
                  selectedMood = "Sad";
                });}, child: Text("😔")),
                ElevatedButton(onPressed: (){setState(() {
                  selectedMood = "Stressed";
                });}, child: Text("😫"))
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: selectedMood == null ? null : (){
                moodHistory.add(selectedMood!);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SubmissionScreen()));
              },
              child: Text("SUBMIT"))
          ],
        ),
      ),
    );
  }
}
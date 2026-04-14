import 'package:flutter/material.dart';
import 'package:my_first_app/select_mood_screen.dart';

class MoodHistoryScreen extends StatefulWidget {
  const MoodHistoryScreen({super.key});

  @override
  State<MoodHistoryScreen> createState() => _MoodHistoryScreenState();
}

class _MoodHistoryScreenState extends State<MoodHistoryScreen> {
  Color _getMoodColor(String mood){
    switch(mood){
      case 'Happy':
        return Colors.blue;
      case 'Sad':
        return Colors.orange;
      case 'Stressed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Mood Tracker", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 93, 15, 107),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Mood History (Current Session)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Expanded(
                child: moodHistory.isEmpty ? 
                Center(
                  child: Text("No mood Entries yet"),
                ):ListView.builder(itemCount: moodHistory.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getMoodColor(moodHistory[index]),
                    ),
                    title: Text("Entry ${index + 1}: ${moodHistory[index]}"),
                  );
                },
                ))
            ],
          ),),
    );
  }
}
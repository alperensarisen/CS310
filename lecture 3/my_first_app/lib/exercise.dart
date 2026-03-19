import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(home: LikeDislikeCounter(),));
class LikeDislikeCounter extends StatefulWidget {
  const LikeDislikeCounter({super.key});

  @override
  State<LikeDislikeCounter> createState() => _LikeDislikeCounterState();
}

class _LikeDislikeCounterState extends State<LikeDislikeCounter> {
  int likes = 0;
  int dislikes = 0;
  void resetCounts(){
    setState(() {
      likes = 0;
      dislikes = 0;
    });
  }
  void like(){
    setState(() {
      likes++;
    });
  }
  void dislike(){
    setState(() {
      dislikes++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Like Dislike Counter App" , style: TextStyle(fontWeight: FontWeight.bold),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("How do you feel about this post",
            style: TextStyle(color: Colors.green),
            ),
            Text("👍 Likes: $likes"),
            Text("👎 Dislikes: $dislikes"),
            ElevatedButton(onPressed: resetCounts, 
            child: Text("Reset Counts", style: TextStyle(color: Colors.green),))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.only(left: 30,right: 30),
          child: FloatingActionButton(onPressed: dislike,backgroundColor: Colors.red, child: Text("👎")), 
          ),
          FloatingActionButton(onPressed: like,
          backgroundColor: Colors.green,
          child: Text("👍"),)
        ],
      ),
      
    );
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
void main() async{
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers:  {'content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode({
      'title' : 'Hello from flutter',
      'body': 'This post created via http.post',
      'userId': 1,
    }),
  );
  if(response.statusCode == 201){
    final created = json.decode(response.body) as Map<String, dynamic>;
    print('Created with id: ${created['id']}');
  }
  try{
    final response2 = await http.get(
      Uri.parse('https://api.example.com/data')
    );
    if(response2.statusCode != 200){
      throw Exception('Failed: ${response2.statusCode}');
    }
    print(response2.body);
  } catch(e){
    print('Error: $e');
  }
}
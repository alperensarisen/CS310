import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MaterialApp(home: myApp()));

class Geo {
  final String lat;
  final String lng;
  Geo({required this.lat, required this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng,
  };
}

class Address {
  final String street, suite, city, zipcode;
  final Geo geo;
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json['street'] as String,
    suite: json['suite'] as String,
    city: json['city'] as String,
    zipcode: json['zipcode'] as String,
    geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
  Map<String, dynamic> toJson() => {
    'street': street,
    'suite': suite,
    'city': city, // Tırnak işareti eklendi
    'zipcode': zipcode,
    'geo': geo.toJson(),
  };
}

class User {
  final int id;
  final String name, username, email, phone, website;
  final Address address; 
  
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
  });
  
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'phone': phone,
    'website': website,
    'address': address.toJson(),
  };
}

class UserService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  
  static Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));
    if (response.statusCode != 200) throw Exception('Data was not found');
    final List<dynamic> list = jsonDecode(response.body);
    return list.map((j) => User.fromJson(j as Map<String, dynamic>)).toList();
  }
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  late Future<List<User>> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = UserService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Users",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder<List<User>>( 
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(users[i].name),
              subtitle: Text(users[i].email),
            ),
          );
        },
      ),
    );
  }
}
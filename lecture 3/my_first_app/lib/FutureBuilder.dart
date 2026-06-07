import 'package:flutter/material.dart';
import 'dart:convert'; //! to decode json
import 'package:http/http.dart' as http;
void main() {
  runApp(const MaterialApp(
    home: MyApp(), // MyApp'i burada çağır
  ));
}
class Product{
  final String title;
  final int price;
  Product({required this.title, required this.price});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      title: json['title'], 
      price: json['price']
    );
  }
}
Future<List<Product>> fetchProducts() async{
  final url = Uri.https('api.escuelajs.co', '/api/v1/products', 
    {
      'categoryId': '2',
      'price_min': '40',
      'price_max': '500',
    }
  );
  final response = await http.get(url);
  if(response.statusCode == 200){
    List jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((data) => Product.fromJson(data)).toList();

  }else{
    throw Exception("Data can not be fetched");
  }
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Product>> _productsFuture;
  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ürünler")),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture, // İsteği buraya bağlıyoruz
        builder: (context, snapshot) {
          // 1. Durum: Yükleniyor
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // 2. Durum: Hata
          else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          }
          // 3. Durum: Veri başarıyla geldi
          else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].title), // Artık nokta ile erişiyoruz
                  subtitle: Text("\$${products[index].price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
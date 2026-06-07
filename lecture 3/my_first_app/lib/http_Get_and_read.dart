//import 'dart:convert'; //! to decode json
import 'package:http/http.dart' as http; //! for http requests
/*void main() async{
  print("data is fetching...");
  final url = Uri.https(
    'api.escuelajs.co',
    'api/v1/products',
    {
      'categoryId': '2',
      'price_min': '40',
      'price_max': '500',
    },
  );
  try{
    final response = await http.get(url);
    if(response.statusCode == 200){
      final List products = jsonDecode(response.body);
      print("Success!");
      for(var i=0; i<(products.length> 3 ? 3: products.length); i++){
        print("product ${products[i]['title']}");
        print("Fiyat: ${products[i]['price']}");
        print("---------");
      }
    }
    else{
      print("error! request failed");
    }
  }catch(e){
    print(e);
  }
} */
void main() async{
  final httpPackageUrl = Uri.https('dart.dev','/f/packages/http.json');
  final httpPackageInfo = await http.read(httpPackageUrl);
  print(httpPackageInfo);
  final response = await http.get(httpPackageUrl);
  if(response.statusCode != 200){
    print("failed!");
    return;
  } 
  print(response.body);
}
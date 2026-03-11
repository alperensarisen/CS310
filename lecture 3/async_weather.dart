Future<int> fetchTemperature(String city) {
  final temps ={"Istanbul": 18, "Berlin": 7, "Tokyo": 22};
  return Future.delayed(Duration(seconds: 1), (){
    if(temps.containsKey(city)) return temps[city]!;
    throw "City not found: $city"; 
  });
}
Future<void> printWeather(String city) async{
  try{
    int temp = await fetchTemperature(city);
    print("$city: $temp °C");
  }
  catch(e){
    print("Error: $e");
  }
}
void main() async{
  await printWeather("Istanbul");
  await printWeather("Berlin");
  await printWeather("Ankara");
}
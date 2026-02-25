void main(){
  Map<String,int> grades ={
    "A":10,
    "B":40,
    "C":80,
    "D":100
  };
  Map<String,int> grades2 ={
    "E":40,
    "H":44
  };

  grades.removeWhere((key, value) => value < 50);
  print(grades);
  for(var key in grades.keys){
    print("$key : ${grades[key]}");
  }
  grades.addAll(grades2); //! to merge 2 map
  print(grades);
 /* Map<int, String> x = {
    1: "A",
    2: "B"
  };
  print(x);
  print(x.containsKey(1));
  print(x.containsValue("C"));  //! expecting false since there is no C
  print(x[1]); //! 1 is not index, it is a key
  x[3] = "D"; //! Adding a new value to map
  x[2] = "F"; //! Also can useable for update data
  x.remove(1);
  
  x.removeWhere((key, value) => key == 1); 
  print(x);
*/
}
import 'dart:math';
import 'dart:io';
void main(){
  Random random = Random();         //! Random from math library
  int secret = random.nextInt(100);
  int? guess;
  int chance = 5;

  while(chance > 0){
    print("Chances left: $chance");
    print("enter your guess: ");
    String? input = stdin.readLineSync();
    guess = int.tryParse(input ?? "");
    if(secret == guess)
    {
      print("You won!");
      break;
    }
    else if(guess == null)
    {
      print("Your input is not valid!");
      continue;
    }
    else{
      print("Try again");
    }
    chance--;
  }
}


import 'package:anaya_timer/anaya_timer.dart';

AnayaTimer anayaTimer;
int count = 0;

main() async {

  print(" ****** Exmaple for anaya_timer ****** ");
  print("This will count from 0 to 9 every 100 milliseconds.");
  print("And then terminate the timer.");
  print("");
  print("");

  // Create the timer.
  anayaTimer = AnayaTimer(Duration(milliseconds: 100), (){
    callBack();
  });

  // Start it.
  anayaTimer.start();

}

void callBack() async {

  print("callBack(): THIS IS THE count: ${count}");

  count = count + 1;

  if(count == 10){

    anayaTimer.dispose();

  }

}




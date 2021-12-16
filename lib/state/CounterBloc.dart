import 'package:agendaboa/state/PageNotifierBloc.dart';
import 'package:flutter/cupertino.dart';

class CounterBloc extends ChangeNotifier with PageNotifierBloc{
  String TAG = "CounterBloc";

  CounterBloc(){
    restart();
  }
  int counterPageOne = 0;
  int counterPageTwo = 0;
  int counterPageThree = 0;

  void restart(){
    counterPageOne = 0;
    counterPageTwo = 0;
    counterPageThree = 0;
    currentPageIndex = 0;
    currentPage = "First";
  }

  void increment(){
      switch(currentPageIndex){
        case 0:
          counterPageOne++;
          break;
        case 1:
          counterPageTwo++;
          break;
        case 2:
          counterPageThree++;
          break;
        default:
          break;
      }
      notifyListeners();
  }



}
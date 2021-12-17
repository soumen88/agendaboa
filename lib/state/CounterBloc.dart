import 'package:agendaboa/constants.dart';
import 'package:agendaboa/models/message.dart';
import 'package:agendaboa/models/message_dao.dart';
import 'package:agendaboa/state/PageNotifierBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class CounterBloc extends ChangeNotifier with PageNotifierBloc{
  String TAG = "CounterBloc";

  CounterBloc(){
    restart();
  }
  int counterPageOne = 0;
  int counterPageTwo = 0;
  int counterPageThree = 0;
  final messageDao = MessageDao();

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

  void saveDeviceDetails() async{
    //Generate a unique identifier
    var uuid = Uuid().v1();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(UNIQUE_KEY, uuid);
    final message = Message(uuid, DateTime.now().toString());
    messageDao.saveMessage(message);


  }


}
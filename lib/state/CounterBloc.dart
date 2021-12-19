import 'package:agendaboa/constants.dart';
import 'package:agendaboa/models/CounterDetails.dart';
import 'package:agendaboa/models/PageDetails.dart';
import 'package:agendaboa/models/message.dart';
import 'package:agendaboa/models/message_dao.dart';
import 'package:agendaboa/network/firebase_dao.dart';
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
  final firebaseDao = FirebaseDao();

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

  void saveFirstTimeDetails() async{

    //Generate a unique identifier
    var uuid = Uuid().v1();
    //Prepare initial values list
    var counter1 = CounterDetails(pageNumber: 1, counterValue: 0);
    var pageDetails1 = PageDetails(pageKey: 1, counterDetails: counter1);
    var counter2 = CounterDetails(pageNumber: 2, counterValue: 0);
    var pageDetails2 = PageDetails(pageKey: 2, counterDetails: counter2);
    var counter3 = CounterDetails(pageNumber: 3, counterValue: 0);
    var pageDetails3 = PageDetails(pageKey: 3, counterDetails: counter3);

    List<PageDetails> pageDetailsList = [pageDetails1,pageDetails2, pageDetails3];
    var keyReceived = await firebaseDao.saveFirstTimeDetails(uuid,pageDetailsList);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(UNIQUE_KEY, keyReceived);
    final message = Message(uuid, DateTime.now().toString());
    messageDao.saveMessage(message);

  }

  void updateDetailsOnServer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(UNIQUE_KEY);
    if(stringValue != null && stringValue.isNotEmpty){
      var counterDetails = CounterDetails(pageNumber: 1, counterValue: 4);
      var pageDetails = PageDetails(pageKey: 1 , counterDetails: counterDetails);
      firebaseDao.savePageDetails(stringValue, pageDetails);
    }
  }


}
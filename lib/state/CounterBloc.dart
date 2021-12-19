import 'dart:convert';

import 'package:agendaboa/constants.dart';
import 'package:agendaboa/models/CounterDetails.dart';
import 'package:agendaboa/models/PageDetails.dart';
import 'package:agendaboa/models/message_dao.dart';
import 'package:agendaboa/network/firebase_dao.dart';
import 'package:agendaboa/state/PageNotifierBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class CounterBloc extends ChangeNotifier with PageNotifierBloc{
  String TAG = "CounterBloc";

  CounterBloc(){
    saveFirstTimeDetails();
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
      var pageNumber = currentPageIndex + 1;
      switch(currentPageIndex){
        case 0:
          counterPageOne++;
          updateDetailsOnServer(pageNumber, counterPageOne);
          break;
        case 1:
          counterPageTwo++;
          updateDetailsOnServer(pageNumber, counterPageTwo);
          break;
        case 2:
          counterPageThree++;
          updateDetailsOnServer(pageNumber, counterPageThree);
          break;
        default:
          break;
      }
      notifyListeners();
  }

  void saveFirstTimeDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? firebaseKey = prefs.getString(UNIQUE_KEY);
    if(firebaseKey == null){
      //Prepare initial values list
      var counter1 = CounterDetails(pageNumber: 1, counterValue: 0);
      var pageDetails1 = PageDetails(pageKey: "1", counterDetails: counter1);
      var counter2 = CounterDetails(pageNumber: 2, counterValue: 0);
      var pageDetails2 = PageDetails(pageKey: "2", counterDetails: counter2);
      var counter3 = CounterDetails(pageNumber: 3, counterValue: 0);
      var pageDetails3 = PageDetails(pageKey: "3", counterDetails: counter3);

      List<PageDetails> pageDetailsList = [pageDetails1,pageDetails2, pageDetails3];
      var keyReceived = await firebaseDao.saveFirstTimeDetails(pageDetailsList);
      prefs.setString(UNIQUE_KEY, keyReceived);
      developer.log(TAG, name: "New key created $keyReceived");
    }

  }

  void readSavedDetailsOnServer() async{
    try{
      final data = await firebaseDao.getQuery().once();
      final values = data.snapshot.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        List<dynamic> valueList = List.from(value);
        valueList.removeWhere((element) => element == null);

        for(var item in valueList){
          //developer.log(TAG, name: "Item only $item");
          var temp = new Map<String, dynamic>.from(item);
          var temp2 = jsonEncode(temp);
          var pageDetails = PageDetails.fromJson(jsonDecode(temp2));
          developer.log(TAG, name: "Temp only 2 $pageDetails");
          switch(pageDetails.pageKey){
            case "1":{
              counterPageOne = pageDetails.counterDetails!.counterValue!;
            }
            break;
            case "2":{
              counterPageTwo = pageDetails.counterDetails!.counterValue!;
            }
            break;
            case "3":{
              counterPageThree = pageDetails.counterDetails!.counterValue!;
            }
            break;
          }
        }
      });
    }
    catch(e){
      developer.log(TAG , name: "Exception $e ");
    }
    notifyListeners();
  }

  void resetDetailsOnServer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? firebaseKey = prefs.getString(UNIQUE_KEY);
    if(firebaseKey != null && firebaseKey.isNotEmpty){
      for(int i = 1 ; i <= 3 ; i++){
        var counterDetails = CounterDetails(pageNumber: i, counterValue: 0);
        var pageDetails = PageDetails(pageKey: "$i" , counterDetails: counterDetails);
        firebaseDao.savePageDetails(firebaseKey, pageDetails);
      }
    }

  }

  void updateDetailsOnServer(int pageNumber, int counterValue) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? firebaseKey = prefs.getString(UNIQUE_KEY);
    if(firebaseKey != null && firebaseKey.isNotEmpty){
      var counterDetails = CounterDetails(pageNumber: pageNumber, counterValue: counterValue);
      var pageDetails = PageDetails(pageKey: "$pageNumber" , counterDetails: counterDetails);
      firebaseDao.savePageDetails(firebaseKey, pageDetails);
    }
  }


}
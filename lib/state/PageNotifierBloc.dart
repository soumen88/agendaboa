import 'package:flutter/cupertino.dart';

mixin PageNotifierBloc on ChangeNotifier{

  String currentPage = "";
  int currentPageIndex = 0;

  void pageStatus(int index){
    currentPageIndex = index;
    switch(index){
      case 0:
        currentPage = "First";
        break;
      case 1:
        currentPage = "Second";
        break;
      case 2:
        currentPage = "Third";
        break;
      default:
        break;
    }
    notifyListeners();
  }

}
import 'package:agendaboa/models/CounterDetails.dart';
import 'package:agendaboa/models/PageDetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:developer' as developer;

class FirebaseDao {
  String TAG = "FirebaseDao";
  //final DatabaseReference _messagesRef = FirebaseDatabase.instance.reference().child('messages');
  final DatabaseReference _detailsRef = FirebaseDatabase.instance.ref('pageDetails');

  Future<String> saveFirstTimeDetails(List<PageDetails> pageDetailsList) async{
    String uniqueKey = "";
    var key = _detailsRef.push();

    uniqueKey = key.key!;
    for(PageDetails pageDetails in pageDetailsList){
      var pageDetailsJson = pageDetails.toJson();
      await key.child(pageDetails.pageKey.toString()).set(pageDetailsJson);
    }

    return Future.value(uniqueKey);
  }

  Future<bool> savePageDetails(String key, PageDetails pageDetails) async{
    var pageDetailsJson = pageDetails.toJson();
    await _detailsRef.child(key).child(pageDetails.pageKey.toString()).set(pageDetailsJson);
    return Future.value(true);
  }

  Query getQuery() {
    return _detailsRef;
  }

}

import 'package:agendaboa/models/CounterDetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'message.dart';
import 'dart:developer' as developer;

class MessageDao {
  String TAG = "MessageDao";
  //final DatabaseReference _messagesRef = FirebaseDatabase.instance.reference().child('messages');
  final DatabaseReference _messagesRef = FirebaseDatabase.instance.ref('messages');

  Future<String> saveMessage(Message message) async{
    var key = _messagesRef.push();
    developer.log(TAG, name: "Key found ${key.key}");
    await key.set(message.toJson());
    return Future.value(key.key);
  }

  Future<String> saveCounterValue(CounterDetails counterDetails) async{
    var key = _messagesRef.push();
    developer.log(TAG, name: "Key found ${key.key}");
    await key.set(counterDetails.toJson());
    return Future.value(key.key);
  }

  Query getMessageQuery() {
    return _messagesRef;
  }
}

import 'package:agendaboa/models/CounterDetails.dart';
import 'package:agendaboa/models/message.dart';
import 'package:agendaboa/models/message_dao.dart';
import 'package:agendaboa/providers/providers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

class FirstPage extends HookWidget{
  final messageDao = MessageDao();
  String TAG = "FirstPage";
  final dbRef = FirebaseDatabase.instance.reference().child("messages");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (builder, watch, child){
            final pageNumber = watch(counterProvider).currentPage;
            final counterValue = watch(counterProvider).counterPageOne;
            final isLoadingComplete = watch(counterProvider).isLoadingComplete;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: !isLoadingComplete,
                    child: Container(
                        child: Center(child: CircularProgressIndicator())
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                Text("You are in $pageNumber page"),
                SizedBox(
                  height: 20,
                ),
                Text("Counter Value $counterValue", style: TextStyle(
                  fontSize: 28
                ),),
                ElevatedButton(onPressed: (){
                  context.read(counterProvider).increment();
                }, child: Text("Increment"))
              ],
            );
          },
        ),
      ),

    );
  }

  void _sendMessage() async{
    final message = Message("Testing for return", DateTime.now().toString());
    var result =  await messageDao.saveMessage(message);
    developer.log(TAG, name: "This is the result $result");
  }

  void _testMessage() async{

  }

  void _getDataMessage() async{
    try{
      final data = await dbRef.once();
      developer.log(TAG, name: "Message received $data");
      final json = data.snapshot.value as Map<dynamic, dynamic>;
      final message = Message.fromJson(json);
      developer.log(TAG, name: "Message received $message");
    }
    catch(e){
      developer.log(TAG , name: "Exception $e ");
    }

  }

  Widget _getMessageList() {
    return Expanded(
      child: FirebaseAnimatedList(
        query: messageDao.getMessageQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final message = Message.fromJson(json);
          return Text(message.text);
        },
      ),
    );
  }

  //get firestore instance
  getDriversList() async {
    return await FirebaseDatabase.instance.reference().child('messages');
  }

}
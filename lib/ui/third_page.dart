import 'package:agendaboa/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ThirdPage extends HookWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NavBar(
        screenName: "Third Page",
        isIconVisible: false,
      ),
      body: Center(
        child: Text("You are in Third page"),
      ),
    );
  }

}
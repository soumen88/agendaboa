import 'package:agendaboa/components/nav_bar.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class FirstPage extends HookWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NavBar(
        screenName: "First Page",
        isIconVisible: false,
      ),
      body: Center(
        child: Text("You are in First page"),
      ),
    );
  }

}
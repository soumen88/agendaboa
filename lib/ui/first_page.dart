import 'package:agendaboa/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstPage extends HookWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NavBar(
          screenName: "First Page",
          isIconVisible: false
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Consumer(
            builder: (builder, watch, child){
              return Column(
                children: [
                    Text("Jai Shiv Shambhoo, Jai bholenaath"),
                ],
              );
            },
          ),
        ),
      ),

    );
  }

}
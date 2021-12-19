import 'package:agendaboa/components/nav_bar.dart';
import 'package:agendaboa/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondPage extends HookWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (builder, watch, child){
            final pageNumber = watch(counterProvider).currentPage;
            final counterValue = watch(counterProvider).counterPageTwo;
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

}
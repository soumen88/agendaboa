import 'package:agendaboa/providers/providers.dart';
import 'package:agendaboa/route/AppRouter.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'dart:developer' as developer;

class HomePage extends HookWidget{
  String TAG = "HomePage";
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (builder, watch, child){
        return AutoTabsScaffold(
          appBarBuilder: (_, tabsRouter) => AppBar(
            backgroundColor: Colors.indigo,
            title: const Text('AgendaBoa'),
            centerTitle: true,
            leading: const AutoBackButton(),
          ),
          backgroundColor: Colors.indigo,
          routes: const [
            FirstPageRouter(),
            SecondPageRouter(),
            ThirdPageRouter()
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return SalomonBottomBar(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              currentIndex: tabsRouter.activeIndex,
              onTap: (int index){
                developer.log(TAG , name: "Index $index");
                context.read(counterProvider).pageStatus(index);
                return tabsRouter.setActiveIndex(index);
              },
              items: [
                SalomonBottomBarItem(
                  selectedColor: Colors.amberAccent,
                  icon: const Icon(
                    Icons.post_add,
                    size: 30,
                  ),
                  title: const Text('Page 1'),
                ),
                SalomonBottomBarItem(
                  selectedColor: Colors.blue[200],
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                  title: const Text('Page 2'),
                ),
                SalomonBottomBarItem(
                  selectedColor: Colors.blue[200],
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                  title: const Text('Page 3'),

                ),
              ],
            );
          },
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              context.read(counterProvider).increment();
            },
            child: Icon(Icons.plus_one) ,
          ),
        );
      },
    );
  }

}
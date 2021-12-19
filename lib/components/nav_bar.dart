import 'package:agendaboa/constants.dart';
import 'package:agendaboa/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

class NavBar extends ConsumerWidget implements PreferredSizeWidget {
  int counter = 0;
  String TAG  = "navBar";
  String? screenName;
  bool? isIconVisible = true;

  NavBar({
    Key? key,
    @required this.screenName,
    @required this.isIconVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    int totalItemCount = 0;
    counter = totalItemCount;
    return AppBar(
      title: Text(screenName!),
      backgroundColor: kCurveColorUp,
      bottomOpacity: 0.0,
      elevation: 0.0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0, top: 8.0),
          child: GestureDetector(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Visibility(
                  child: Icon(
                    Icons.sync,
                    size: 36.0,
                  ),
                  visible: isIconVisible!,
                ),
                if (counter > 0)
                  Visibility(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          counter.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    visible: isIconVisible!,
                  ),
              ],
            ),
            onTap: () {
              developer.log(TAG , name: "Reset details");
              context.read(counterProvider).restart();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
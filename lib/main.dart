import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:python_api_test/home_tab.dart';
//import 'package:flutter/services.dart';

import 'home_tab.dart';
import 'mid_tab.dart';
import 'last_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  */

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            //label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.smiley),
            //label: 'Stuff',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            //label: 'About',
          ),
        ],
        activeColor: Colors.red,
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: MidTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: LastTab(),
              );
            });
            break;
        }
        return returnValue;
      }, 
    );
  }
}
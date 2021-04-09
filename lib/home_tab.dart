import 'package:flutter/cupertino.dart';
import 'mid_tab.dart';

int counter = 0;
String title = 'Howdy!';

class HomeTab extends StatefulWidget {
  _HomeTab createState() => new _HomeTab();
}

class _HomeTab extends State<HomeTab> {
  void doit() {
    setState(() => counter++);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> packet = MidTab().getUserData();
    try {
      if(packet['name'] != null){
        title = 'Howdy, ${packet['name']}!';
      }
      else{
        title = "Howdy!";
      }
    } catch (e) {
      print(e);
      title = "Howdy!";
    }

    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text(title),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            //height: 100,
            child: Column(
                children: [
                  Padding(padding: new EdgeInsets.all(100.0)),
                  CupertinoButton(child: Text('Click Me'), onPressed: doit, color: const Color(0xFFF44336)),
                  Padding(padding: new EdgeInsets.all(25.0)),
                  Text('Times Pressed: $counter'),
                ], 
            ),
          ),
        ),
      ],
    );
  }
}
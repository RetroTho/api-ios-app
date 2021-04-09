import 'package:flutter/cupertino.dart';

class LastTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('About'),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int counter = 0;
String htmlToParse = '';
String imgName = 'jdm.jpg';
Map<String, dynamic> packet;

class MidTab extends StatefulWidget {
  _MidTab createState() => new _MidTab();
  Map getUserData() {
    return packet;
  }
}

class _MidTab extends State<MidTab> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwordController = TextEditingController();

  void doit() async {
    String unameINP = _unameController.text;
    String pwordINP = _pwordController.text;

    var response = await http.post(
      Uri.http('192.168.7.53:8080', 'login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': unameINP, 'password': pwordINP
      }),
    );
    counter++;
    //If the http request is successful the statusCode will be 200
    if(response.statusCode == 200){
      packet = jsonDecode(response.body);

      htmlToParse = packet['attempt'];
      print(htmlToParse);
      setState(() => htmlToParse);
      imgName = 'rx7.jpg';
      setState(() => imgName);
    }
    else{
      htmlToParse = 'oof';
      print(response.statusCode);
      print(htmlToParse);
      setState(() => htmlToParse);
    }

    //_unameController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Stuff'),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 1000,
            child: Column(
                children: [
                  Padding(padding: new EdgeInsets.only(top: 100.0)),
                  Text('LOGIN'),
                  Padding(padding: new EdgeInsets.only(top: 30.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Username: '),
                      Padding(padding: new EdgeInsets.only(right: 10.0)),
                      Container(
                        width: 200,
                        child: CupertinoTextField(controller: _unameController),
                      ),
                    ],
                  ),
                  Padding(padding: new EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Password: '),
                      Padding(padding: new EdgeInsets.only(right: 10.0)),
                      Container(
                        width: 200,
                        child: CupertinoTextField(controller: _pwordController, obscureText: true,),
                      ),
                    ],
                  ),
                  CupertinoButton(child: Text('Login'), onPressed: doit, color: const Color(0xFFF44336)),
                  Padding(padding: new EdgeInsets.only(top: 25.0)),
                  Text('HTTP: $htmlToParse'),
                  //Image.network('http://localhost:8080/static/$imgName')
                  
                ], 
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class UserData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return userData();
  }
}

class userData extends State<UserData>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User'),
      backgroundColor: Colors.lightBlueAccent,),
      body: Center(
        child: Container(
          color: Colors.purple,
        ),
      ),
    );
  }
}
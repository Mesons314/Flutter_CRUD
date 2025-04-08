import 'package:crud_frontend/Routes/RoutesName.dart';
import 'package:crud_frontend/Services/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:crud_frontend/Screens/main.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return splashScreen();
  }
}

class splashScreen extends State<SplashScreen>{

  SplashService splashService = SplashService();
  @override
  void initState(){
    super.initState();
    splashService.homePage(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text('User Info',
          style: TextStyle(
            color: Colors.black87,
            fontStyle: FontStyle.italic,
            fontSize: 45,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }

}
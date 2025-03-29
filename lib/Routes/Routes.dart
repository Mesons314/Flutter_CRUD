import 'package:crud_frontend/Screens/SplashScreen.dart';
import 'package:crud_frontend/Screens/UserData.dart';
import 'package:crud_frontend/Screens/UserForm.dart';
import 'package:crud_frontend/Screens/UserList.dart';
import 'package:crud_frontend/Screens/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'RoutesName.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context)=> const SplashScreen());
      case RoutesName.userList:
        return MaterialPageRoute(builder: (context)=> UserList());
      case RoutesName.userForm:
        return MaterialPageRoute(builder: (context)=> const UserForm());
      case RoutesName.homePage:
        return MaterialPageRoute(builder: (context)=> const MyHomePage(title: 'Bloc'));
      case RoutesName.userData:
        return MaterialPageRoute(builder: (context)=> UserData());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          );
        });
    }
}
}
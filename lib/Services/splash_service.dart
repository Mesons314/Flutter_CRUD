
import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../Routes/RoutesName.dart';

class SplashService{
  void homePage(BuildContext context){
    Timer(Duration(seconds: 4),()=>Navigator
    .pushNamedAndRemoveUntil(context, RoutesName.homePage , (route)=>false));
  }
}
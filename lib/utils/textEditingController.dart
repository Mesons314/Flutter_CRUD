import 'package:flutter/material.dart';

class TextEditing{
  TextEditingController dob = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController location = TextEditingController();
  String gender = 'Male';

  void clearAll(){
    location.clear();
    lastName.clear();
    firstName.clear();
    age.clear();
    dob.clear();
    gender = 'Male';
  }
}
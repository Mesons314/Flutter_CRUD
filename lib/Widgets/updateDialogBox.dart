
import 'package:crud_frontend/Screens/updateUser.dart';
import 'package:flutter/material.dart';

void updateDialogBox(BuildContext context, int id){
  showDialog(context: context, builder: (context)=> AlertDialog(
    icon: Icon(Icons.update),
    title: Text('Update'),
    content: Text('Do you want to update'),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> updateUser(id:id)));
      },child: Text('YES'),),
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('NO'))
    ],
  ));
}
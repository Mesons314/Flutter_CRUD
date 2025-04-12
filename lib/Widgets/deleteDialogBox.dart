
import 'package:flutter/material.dart';

Future<bool?> deleteDialogBox (BuildContext context,int id){
  return showDialog(context: context,
      builder: (context)=> AlertDialog(
        title: Text('Delete'),
        content: Text('Are you sure you want to delete the data'),
        icon: Icon(Icons.delete),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context,true);
          }, child: Text('YES',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600),)),
          TextButton(onPressed: (){
            Navigator.pop(context,false);
          }, child: Text('NO',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600),))
        ],
      ));

}
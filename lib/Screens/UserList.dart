import 'package:flutter/material.dart';

import 'UserData.dart';

class UserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return userlist();
  }
}
  class userlist extends State<UserList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('User'),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserData()));
            },
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.person
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text('Abhinav Dwivedi'),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text('Mumbai'),
              ),
            ),
          )
        ],
      )
    );
  }

  }

import 'package:crud_frontend/Routes/RoutesName.dart';
import 'package:crud_frontend/Widgets/deleteDialogBox.dart';
import 'package:crud_frontend/Widgets/updateDialogBox.dart';
import 'package:crud_frontend/user_Repo/user_repository.dart';
import 'package:flutter/material.dart';

import '../Models/user_model.dart';

class UserList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return userlist();
  }
}
  class userlist extends State<UserList>{
  late Future<List<User>> _userList;

  @override
  void initState(){
    super.initState();
    _userList = UserRepository().getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('User'),
      ),
      body: FutureBuilder<List<User>>(
        future: _userList,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          
          if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'),);
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No user found'));
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                final user = snapshot.data![index];
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(
                      context,
                      RoutesName.userData,
                      arguments: user.id,
                    );
                  },
                  onDoubleTap: () async{
                    bool? wantToDelete = await deleteDialogBox(context, user.id!);
                    if(wantToDelete == true){
                      try{
                        await UserRepository().deleteById(user.id!);
                        setState(() {
                          _userList = UserRepository().getUser();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data Deleted')));
                      }catch(e){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$e'))
                        );
                      }
                    }
                  },
                  onLongPress: (){
                    updateDialogBox(context, user.id!);
                  },
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('${user.firstName ?? "N/A"} ${user.lastName ?? ""}'),
                    subtitle: Text(user.location ?? "Unknown"),
                  ),
                );
              },
          );
        },
      )
    );
  }
  }

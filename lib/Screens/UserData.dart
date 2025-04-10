import 'package:flutter/material.dart';

import '../Models/user_model.dart';
import '../user_Repo/user_repository.dart';

class UserData extends StatefulWidget {
  final int userId;

  const UserData({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  late Future<User> _user;

  @override
  void initState() {
    super.initState();
    _user = UserRepository().getUserById(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details'), backgroundColor: Colors.lightBlueAccent),
      body: FutureBuilder<User>(
        future: _user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.firstName ?? "N/A"} ${user.lastName ?? ""}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Age: ${user.age ?? "N/A"}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Date of Birth: ${user.dob ?? "N/A"}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Location: ${user.location ?? "N/A"}', style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}

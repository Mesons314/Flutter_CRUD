import 'package:crud_frontend/UserForm.dart';
import 'package:crud_frontend/UserList.dart';
import 'package:flutter/material.dart';
import 'package:crud_frontend/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Center(
                child: SizedBox(
                  width: 125,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UserForm()));
                  },
                    style: ElevatedButton.styleFrom(
                      elevation: 11,
                      shadowColor: Colors.black
                    ),
                      child: const Text('Add User',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontStyle: FontStyle.italic
                      ),
                      ),
                  ),
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: SizedBox(
                  width: 125,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserList()));
                  },
                    style: ElevatedButton.styleFrom(
                      elevation: 11,
                      shadowColor: Colors.black
                    ),
                      child: const Text('Users',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent
                      ),
                      ),
                  ),
                ),
              ),)
          ],
        ),
      ),

    );
  }
}

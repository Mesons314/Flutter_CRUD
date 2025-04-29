import 'package:crud_frontend/Routes/RoutesName.dart';
import 'package:crud_frontend/user_Repo/user_repository.dart';
import 'package:crud_frontend/utils/textEditingController.dart';
import 'package:flutter/material.dart';
import '../Models/user_model.dart';
import '../Widgets/text_field.dart';

class updateUser extends StatefulWidget{
  final int id;
  updateUser({super.key,required this.id});
  @override
  State<StatefulWidget> createState() {
    return _updateUser();
  }
}
class _updateUser extends State<updateUser>{
  final controllers = TextEditing();
  final repo = UserRepository();

  late Future<User> user;
  void initState(){
    super.initState();
    user = UserRepository().getUserById(widget.id);
    user.then((onValue){
      controllers.firstName.text = onValue.firstName??'';
      controllers.lastName.text = onValue.lastName??'';
      controllers.location.text = onValue.location??'';
      controllers.dob.text = onValue.dob??'';
      controllers.age.text = onValue.age??'';
      controllers.gender = onValue.gender??'';
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: FutureBuilder(future: user,
          builder: (context ,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text('error ${snapshot.error}'),);
        }
        final user = snapshot.data!;
        return Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 25,left: 15,right: 15),
            child: text_field(HintText: 'First Name',
                controller_in: controllers.firstName)
            ),
            Padding(padding: EdgeInsets.only(top: 25,left: 15,right: 15),
                child: text_field(HintText: 'Last Name',
                    controller_in: controllers.lastName)
            ),
            Padding(padding: EdgeInsets.only(top: 25,left: 15,right: 15),
                child: text_field(HintText: 'Location',
                    controller_in: controllers.location)
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 25,left: 15,right: 15),
                 child: DropdownMenu<String>(
                   hintText: 'Gender',
                   initialSelection: controllers.gender,
                   onSelected: (value){
                     setState(() {
                       controllers.gender = value!;
                     });
                   },
                   dropdownMenuEntries: <DropdownMenuEntry<String>>[
                     DropdownMenuEntry(value: 'Male', label: 'Male'),
                     DropdownMenuEntry(value: 'Female', label: 'Female'),
                     DropdownMenuEntry(value: 'Others', label: 'Others')
                   ],
                   inputDecorationTheme: InputDecorationTheme(
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12)
                       )
                   ),
                 ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                    child: Container(
                      width: 180,
                      child: InkWell(
                        child: TextField(
                          onTap: () async {
                            DateTime now =  DateTime.now();
                            DateTime last = DateTime(2025,12,31);

                            DateTime? picked = await showDatePicker(context: context,
                                initialDate: now.isAfter(last)? last: now,
                                firstDate: DateTime(1900),
                                lastDate: last);
                            if(picked != null){
                              setState(() {
                                controllers.dob.text  = "${picked.day}/${picked.month}/${picked.year}";
                              });
                            }
                          },
                          controller: controllers.dob,
                          decoration: InputDecoration(
                            hintText: 'DOB',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 25,left: 15,right: 325),
            child: text_field(HintText: 'Age', controller_in: controllers.age),),

            SizedBox(height: 50,),
            ElevatedButton(onPressed: () async{
              try{
                User user = User(
                    firstName: controllers.firstName.text,
                    lastName: controllers.lastName.text,
                    dob: controllers.dob.text,
                    gender: controllers.gender,
                    age: controllers.age.text,
                    location: controllers.location.text);

                await repo.updateUser1(widget.id, user);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Updated Successfully')));

                Navigator.pushNamed(context, RoutesName.userList);
              }catch(e){
                print('Error: $e');
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Updated Successfully')));
              }
            },
                child: Text('Update',
                style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                backgroundColor: Colors.lightBlueAccent,
              ),)
          ],
        );
          })
    );
  }

}
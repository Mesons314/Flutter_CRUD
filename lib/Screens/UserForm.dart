
import 'package:crud_frontend/Models/user_model.dart';
import 'package:crud_frontend/Widgets/text_field.dart';
import 'package:crud_frontend/user_Repo/user_repository.dart';
import 'package:flutter/material.dart';

import '../utils/textEditingController.dart';

class UserForm extends StatefulWidget{
  const UserForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _formData();
  }
}

class _formData extends State<UserForm> {

  final controllers = TextEditing();
  final repo = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('UserForm'),
      ),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
          child:text_field(HintText: 'First Name',controller_in: controllers.firstName,)
          ),
          Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
          child: text_field(HintText: 'Last Name',controller_in: controllers.lastName,)
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 12),
                    child: DropdownMenu<String>(

                      hintText: 'Gender',
                      initialSelection: controllers.gender,
                      onSelected: (value){
                        setState(() {
                          controllers.gender = value!;
                        });
                      },
                      requestFocusOnTap: true,
                      dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'Male', label: 'Male'),
                        DropdownMenuEntry(value: 'Female', label: 'Female'),
                        DropdownMenuEntry(value: 'Other', label: 'Other')
                      ],
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 200,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12,top: 12),
                    child: TextField(
                      onTap: () async{
                        DateTime now = DateTime.now();
                        DateTime lastDate = DateTime(2025,12,31);

                        DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: now.isAfter(lastDate)?lastDate: now,
                            firstDate: DateTime(1900),
                            lastDate: lastDate
                        );
                        if(picked != null){
                          setState(() {
                            controllers.dob.text = "${picked.day}/${picked.month}/${picked.year}";
                          });
                        }
                      },
                      controller: controllers.dob,
                      decoration: InputDecoration(
                          hintText: "DOB",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent
                              )
                          )
                      ),
                      readOnly: true,
                    ),
                  ),
                ),
              )
            ],
          ),
         Row(
           children: [
             Expanded(
               child: Padding(padding: const EdgeInsets.only(top: 12,left: 15),
                   child: text_field(HintText: 'Age',controller_in: controllers.age,)
               ),
             ),
             Container(
               width: 200,
               margin: const EdgeInsets.only(left: 15),
               child: Padding(padding: const EdgeInsets.only(top: 12,right: 15),
                 child: text_field(HintText: 'Location',controller_in: controllers.location,)
               ),
             )
           ],
         ),

          const SizedBox(height: 100),
          ElevatedButton(onPressed: () async{
            try{
              User user = User(
                firstName: controllers.firstName.text,
                lastName: controllers.lastName.text,
                age: controllers.age.text,
                dob: controllers.dob.text,
                gender: controllers.gender,
                location: controllers.location.text,
              );
              await repo.addUser(user);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                  const SnackBar(
                      content: Text(
                          'User Added succesfully'
                      )
                  )
              );
              setState(() {
                controllers.clearAll();
              });
            }catch(e){
              print('Error: $e');
              ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Error in adding the user')));
            }
          },
              child: const Text('Submit'),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.black,
              backgroundColor: Colors.lightBlueAccent,
            ),
          )
        ],
      ),
    );
  }
}



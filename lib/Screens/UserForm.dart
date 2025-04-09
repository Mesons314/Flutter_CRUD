
import 'package:crud_frontend/Models/user_model.dart';
import 'package:crud_frontend/Widgets/text_field.dart';
import 'package:crud_frontend/user_Repo/user_repository.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget{
  const UserForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _formData();
  }
}

class _formData extends State<UserForm> {

  TextEditingController dateController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController location = TextEditingController();
  String genderSelection = 'Male';
  final repo = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('UserForm'),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 25),
          child:text_field(HintText: 'First Name',controller_in: firstName,)
          ),
          Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 10),
          child: text_field(HintText: 'Last Name',controller_in: lastName,)
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 12),
                    child: DropdownMenu<String>(

                      hintText: 'Gender',
                      initialSelection: genderSelection,
                      onSelected: (value){
                        setState(() {
                          genderSelection = value!;
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
                margin: EdgeInsets.only(left: 15),
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
                            dateController.text = "${picked.day}/${picked.month}/${picked.year}";
                          });
                        }
                      },
                      controller: dateController,
                      decoration: InputDecoration(
                          hintText: "DOB",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
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
               child: Padding(padding: EdgeInsets.only(top: 12,left: 15),
                   child: text_field(HintText: 'Age',controller_in: age,)
               ),
             ),
             Container(
               width: 200,
               margin: EdgeInsets.only(left: 15),
               child: Padding(padding: EdgeInsets.only(top: 12,right: 15),
                 child: text_field(HintText: 'Location',controller_in: location,)
               ),
             )
           ],
         ),

          SizedBox(height: 100),
          ElevatedButton(onPressed: () async{
            try{
              User user = User(
                firstName: firstName.text,
                lastName: lastName.text,
                age: age.text,
                DOB: dateController.text,
                gender: genderSelection,
                location: location.text,
              );
              await repo.addUser(user);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                  SnackBar(
                      content: Text(
                          'User Added succesfully'
                      )
                  )
              );
            }catch(e){

            }
          },
              child: Text('Submit'),
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



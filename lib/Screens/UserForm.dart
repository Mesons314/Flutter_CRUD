import 'dart:developer';

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
          child: TextField(
            decoration: InputDecoration(
                hintText: "First Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)
                )
            ),
          ),
          ),
          Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Last Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.black38,
                  style: BorderStyle.solid
                )
              )
            ),
          ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 12),
                    child: DropdownMenu<String>(
                      hintText: 'Gender',
                      requestFocusOnTap: true,
                      dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: '1', label: 'Male'),
                        DropdownMenuEntry(value: '1', label: 'Female'),
                        DropdownMenuEntry(value: '1', label: 'Other')
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
                   child: TextField(
                     decoration: InputDecoration(
                         hintText: 'Age',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(12)
                         )
                     ),
                   )
               ),
             ),
             Container(
               width: 200,
               margin: EdgeInsets.only(left: 15),
               child: Padding(padding: EdgeInsets.only(top: 12,right: 15),
                 child: TextField(
                   decoration: InputDecoration(
                       hintText: 'Location',
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12)
                       )
                   ),
                 ),
               ),
             )
           ],
         )
        ],
      ),
    );
  }
}



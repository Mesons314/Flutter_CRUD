
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class text_field extends StatefulWidget {
  final String HintText;
  final TextEditingController controller_in;
  const text_field({super.key,required this.HintText, required this.controller_in});

  @override
  State<text_field> createState() {
    return _textField();
  }
}

class _textField extends State<text_field>{
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller_in,
        decoration: InputDecoration(
          hintText: widget.HintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black,
              style: BorderStyle.solid
            )
          )
        ),
    );
  }

}
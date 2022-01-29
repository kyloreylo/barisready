import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Function metot;
  String suffixText;
  String labelText;
  String errorText;
  String hintText;
  bool kontrol;

  CustomTextField({
    @required this.metot,
    @required this.suffixText,
    @required this.labelText,
    @required this.errorText,
    @required this.hintText,
    @required this.kontrol,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: metot,
        cursorColor: Colors.red,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixText: suffixText,
          suffixStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          labelText: labelText,
          errorText: kontrol ? errorText : null,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

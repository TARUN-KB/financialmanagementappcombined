import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    hintStyle: TextStyle(color: Colors.black),

    errorStyle: TextStyle(color: Colors.red),

    fillColor: Colors.grey[400],
    filled: true,
    focusedBorder: OutlineInputBorder(

      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
          color: Colors.green,
          width: 2.5
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 2.5,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2.5,
      ),
    ),
  );
}
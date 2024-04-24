// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

PasswordValidation(BuildContext context, String text ,bool theChanges) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theChanges ? Colors.green : Colors.white,
           border: Border.all(color: const Color.fromARGB(255, 189, 189, 189),)
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 15,
        ),
      ),
      SizedBox(
        width: 11,
      ),
      Text(text),
    ],
  );
}

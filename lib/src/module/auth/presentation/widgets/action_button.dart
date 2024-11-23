import 'package:flutter/material.dart';

Widget actionButton(String text) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

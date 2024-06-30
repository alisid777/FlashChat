import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  Color customColor;
  String label;
  VoidCallback onPressed;
  MyCustomButton(
      {super.key,
      required this.customColor,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: customColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}

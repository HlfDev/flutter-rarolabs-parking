import 'package:flutter/material.dart';

class ElevatedButtonRoundedWidget extends StatelessWidget {
  final String title;
  const ElevatedButtonRoundedWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      label: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      icon: Icon(
        Icons.garage,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}

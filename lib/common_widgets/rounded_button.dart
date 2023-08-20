import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  RoundedButton({this.colour, required this.text, required this.onPressed});

  late final Color? colour;
  late final String text;
  late final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour ?? Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed as void Function(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
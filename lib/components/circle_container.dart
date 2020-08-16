import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Color colour;
  final String number;
  CircleContainer(this.colour, this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(2.0),
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: colour,
        shape: BoxShape.circle,
      ),
      child: Text(this.number),
    );
  }
}

import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function() onTap;

  const CircularButton(
      {@required this.child, @required this.onTap, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}

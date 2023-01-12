import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String name;
  MyButton(this.onTap, this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(23),
        margin: EdgeInsets.all(25),
        child: Center (child: Text(name, style: TextStyle(color: Colors.white, fontSize: 20),)),
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

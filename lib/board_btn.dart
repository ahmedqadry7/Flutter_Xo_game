import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoardBtn extends StatelessWidget {
  String label;
  Function onClick;
  int index;
  BoardBtn({
    required this.index,
    required this.onClick, required this.label , super.key});

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onClick(index);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            )),
        child: Text(label,
        style: TextStyle(fontSize: 50,
        fontWeight: FontWeight.w200 , color: Colors.white),)
    ));
  }
}

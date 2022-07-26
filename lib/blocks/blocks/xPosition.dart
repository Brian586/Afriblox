import 'package:flutter/material.dart';

class XPosition extends StatefulWidget {
  const XPosition({Key? key}) : super(key: key);

  @override
  State<XPosition> createState() => _XPositionState();
}

class _XPositionState extends State<XPosition> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: isSelected,
          checkColor: Colors.white,
          activeColor: Colors.blue,
          hoverColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          onChanged: (v) {
            setState(() {
              isSelected = v!;
            });
          },
        ),
        const SizedBox(width: 5.0,),
        Container(
          height: 30.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blue
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(child: Text("x position", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),)),
          ),
        )
      ],
    );
  }
}

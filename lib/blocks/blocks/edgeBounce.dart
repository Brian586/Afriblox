import 'package:flutter/material.dart';

import '../blockType/blockA.dart';

class EdgeBounce extends StatefulWidget {
  const EdgeBounce({Key? key}) : super(key: key);

  @override
  State<EdgeBounce> createState() => _EdgeBounceState();
}

class _EdgeBounceState extends State<EdgeBounce> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(
              100.0,
              (100.0 * 0.3645833333333333)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: BlockA(extensionLength: 0.0, color: Colors.blue),
          child: const SizedBox(
            height: 35.0,
            width: 105.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 7.0, top: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: 5.0,),
              Text("if on edge, bounce", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              SizedBox(width: 5.0,),
            ],
          ),
        )
      ],
    );
  }
}


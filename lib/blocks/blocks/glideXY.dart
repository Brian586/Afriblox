import 'package:flutter/material.dart';

import '../blockType/blockA.dart';
import '../widgets/blockTextField.dart';

class GlideXY extends StatefulWidget {
  const GlideXY({Key? key}) : super(key: key);

  @override
  State<GlideXY> createState() => _GlideXYState();
}

class _GlideXYState extends State<GlideXY> {
  TextEditingController secs = TextEditingController();
  TextEditingController x = TextEditingController();
  TextEditingController y = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(
              100.0,
              (100.0 * 0.3645833333333333)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: BlockA(extensionLength: 100.0, color: Colors.blue),
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
            children: [
              const SizedBox(width: 5.0,),
              const Text("glide", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              BlockTextField(
                controller: secs,
                focusColor: Colors.blue,
              ),
              const SizedBox(width: 5.0,),
              const Text("secs to x:", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              BlockTextField(
                controller: x,
                focusColor: Colors.blue,
              ),
              const SizedBox(width: 5.0,),
              const Text("y:", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              BlockTextField(
                controller: y,
                focusColor: Colors.blue,
              ),
              const SizedBox(width: 5.0,),
            ],
          ),
        )
      ],
    );
  }
}


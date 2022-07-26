import 'package:flutter/material.dart';

import '../blockType/blockA.dart';
import '../widgets/blockTextField.dart';

class PointDirection extends StatefulWidget {
  const PointDirection({Key? key}) : super(key: key);

  @override
  State<PointDirection> createState() => _PointDirectionState();
}

class _PointDirectionState extends State<PointDirection> {
  TextEditingController direction = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(
              100.0,
              (100.0 * 0.3645833333333333)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: BlockA(extensionLength: 30.0, color: Colors.blue),
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
              const Text("point to direction", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              BlockTextField(
                controller: direction,
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

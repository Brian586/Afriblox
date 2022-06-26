import 'package:flutter/material.dart';

import '../blockType/blockA.dart';
import '../widgets/blockTextField.dart';

class TurnCW extends StatefulWidget {
  const TurnCW({Key? key}) : super(key: key);

  @override
  State<TurnCW> createState() => _TurnCWState();
}

class _TurnCWState extends State<TurnCW> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          100.0,
          (100.0 * 0.3645833333333333)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: BlockA(extensionLength: 10.0, color: Colors.blue),
      child: SizedBox(
        height: 35.0,
        width: 110.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("turn", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
                const SizedBox(width: 5.0,),
                BlockTextField(
                  controller: controller,
                  focusColor: Colors.blue,
                ),
                const SizedBox(width: 5.0,),
                const Text("degrees", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

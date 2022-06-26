import 'package:afriblox/blocks/blockType/blockA.dart';
import 'package:afriblox/blocks/widgets/blockTextField.dart';
import 'package:flutter/material.dart';


class Move extends StatefulWidget {
  const Move({Key? key}) : super(key: key);

  @override
  State<Move> createState() => _MoveState();
}

class _MoveState extends State<Move> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          100.0,
          (100.0 * 0.3645833333333333)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: BlockA(extensionLength: 2.0, color: Colors.blue),
      child: SizedBox(
        height: 35.0,
        width: 105.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("move", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
                const SizedBox(width: 5.0,),
                BlockTextField(
                  controller: controller,
                  focusColor: Colors.blue,
                ),
                const SizedBox(width: 5.0,),
                const Text("steps", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

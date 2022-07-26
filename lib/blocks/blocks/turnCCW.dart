import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../blockType/blockA.dart';
import '../widgets/blockTextField.dart';


class TurnCCW extends StatefulWidget {
  const TurnCCW({Key? key}) : super(key: key);

  @override
  State<TurnCCW> createState() => _TurnCCWState();
}

class _TurnCCWState extends State<TurnCCW> {
  TextEditingController controller = TextEditingController();
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
              const Text("turn", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              SvgPicture.asset(
                "assets/icons/rotate_left.svg",
                color: Colors.white,
                height: 20.0,
              ),
              const SizedBox(width: 5.0,),
              BlockTextField(
                controller: controller,
                focusColor: Colors.blue,
              ),
              const SizedBox(width: 5.0,),
              const Text("degrees", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
            ],
          ),
        )
      ],
    );
  }
}

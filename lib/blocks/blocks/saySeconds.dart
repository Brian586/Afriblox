import 'package:flutter/material.dart';

import '../blockType/blockA.dart';
import '../widgets/blockTextField.dart';

class SaySeconds extends StatefulWidget {
  const SaySeconds({Key? key}) : super(key: key);

  @override
  State<SaySeconds> createState() => _SaySecondsState();
}

class _SaySecondsState extends State<SaySeconds> {
  TextEditingController word = TextEditingController();
  TextEditingController seconds = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(
              100.0,
              (100.0 * 0.3645833333333333)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: BlockA(extensionLength: 50.0, color: Colors.deepPurple),
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
              const Text("say", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              BlockTextField(
                controller: word,
                focusColor: Colors.blue,
              ),
              const SizedBox(width: 5.0,),
              const Text("for", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              BlockTextField(
                controller: seconds,
                focusColor: Colors.blue,
              ),
              const SizedBox(width: 5.0,),
              const Text("seconds", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
            ],
          ),
        )
      ],
    );
  }
}

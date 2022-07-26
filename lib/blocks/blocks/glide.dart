import 'package:flutter/material.dart';

import '../blockType/blockA.dart';
import '../widgets/blockTextField.dart';

class Glide extends StatefulWidget {
  const Glide({Key? key}) : super(key: key);

  @override
  State<Glide> createState() => _GlideState();
}

class _GlideState extends State<Glide> {
  String option = "random position";
  TextEditingController secs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(
              100.0,
              (100.0 * 0.3645833333333333)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: BlockA(extensionLength: 130.0, color: Colors.blue),
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
              const Text("secs to", style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
              const SizedBox(width: 5.0,),
              PopupMenuButton<String>(
                color: Colors.blue,
                offset: const Offset(0.0, 15.0),
                onSelected: (str) {
                  setState(() {
                    option = str;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return ["random position", "mouse pointer"].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice, style: const TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
                    );
                  }).toList();
                },
                child: Container(
                  height: 20.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue.shade800
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(option, style: const TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w600),),
                        //SizedBox(width: 3.0,),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Icon(Icons.arrow_drop_down_rounded, color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5.0,),
            ],
          ),
        )
      ],
    );
  }
}


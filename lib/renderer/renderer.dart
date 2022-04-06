import 'package:flutter/material.dart';

class AfribloxRenderer extends StatefulWidget {
  const AfribloxRenderer({Key? key}) : super(key: key);

  @override
  _AfribloxRendererState createState() => _AfribloxRendererState();
}

class _AfribloxRendererState extends State<AfribloxRenderer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
            width: 0.5
          )
        ),
      ),
    );
  }
}

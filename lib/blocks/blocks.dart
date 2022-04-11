import 'package:afriblox/blocks/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AfribloxBlocks extends StatefulWidget {
  const AfribloxBlocks({Key? key}) : super(key: key);

  @override
  _AfribloxBlocksState createState() => _AfribloxBlocksState();
}

class _AfribloxBlocksState extends State<AfribloxBlocks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.035,
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  height: 50.0,
                  width: size.width * 0.035,
                  color: Theme.of(context).primaryColor,
                  child: SvgPicture.asset("assets/icons/add_extensions.svg"),
                )
              ],
            ),
          ),
          const VerticalDivider(
            width: 0.2,
            color: Colors.grey,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPaint(
                  size: Size(
                      100.0,
                      (100.0 * 0.3645833333333333)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                  child:
                      Container(height: 35.0, width: 96.0, child: Text("data")),
                ),
                CustomPaint(
                  size: Size(
                      100.0,
                      (100.0 * 0.3645833333333333)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(extensionLength: 200.0),
                  child: Container(
                      height: 35.0,
                      width: 96.0,
                      child: Center(child: Text("data"))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

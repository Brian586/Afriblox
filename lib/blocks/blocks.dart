import 'package:afriblox/blocks/blocks/move.dart';
import 'package:afriblox/blocks/blocks/turnCW.dart';
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
          SizedBox(
            width: 300.0,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Motion",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Move(),
                  SizedBox(
                    height: 5.0,
                  ),
                  TurnCW(),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            width: 0.2,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}

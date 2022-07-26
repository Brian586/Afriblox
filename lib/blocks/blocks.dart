import 'package:afriblox/blocks/blocks/changeX.dart';
import 'package:afriblox/blocks/blocks/changeY.dart';
import 'package:afriblox/blocks/blocks/direction.dart';
import 'package:afriblox/blocks/blocks/edgeBounce.dart';
import 'package:afriblox/blocks/blocks/glide.dart';
import 'package:afriblox/blocks/blocks/glideXY.dart';
import 'package:afriblox/blocks/blocks/goTo.dart';
import 'package:afriblox/blocks/blocks/goToXY.dart';
import 'package:afriblox/blocks/blocks/move.dart';
import 'package:afriblox/blocks/blocks/pointDirection.dart';
import 'package:afriblox/blocks/blocks/pointTowards.dart';
import 'package:afriblox/blocks/blocks/saySeconds.dart';
import 'package:afriblox/blocks/blocks/setX.dart';
import 'package:afriblox/blocks/blocks/setY.dart';
import 'package:afriblox/blocks/blocks/turnCW.dart';
import 'package:afriblox/blocks/blocks/xPosition.dart';
import 'package:afriblox/blocks/blocks/yPosition.dart';
import 'package:afriblox/blocks/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'blocks/turnCCW.dart';

class AfribloxBlocks extends StatefulWidget {
  const AfribloxBlocks({Key? key}) : super(key: key);

  @override
  _AfribloxBlocksState createState() => _AfribloxBlocksState();
}

class _AfribloxBlocksState extends State<AfribloxBlocks> {
  double height = 10.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          SizedBox(
            width: 70.0,
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: blockCategories.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      BlockCategory category = blockCategories[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {

                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: category.color, size: 30.0,),
                              const SizedBox(height: 3.0,),
                              Text(category.category!, style: const TextStyle(fontSize: 10.0),)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 70.0,
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Motion",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    const Move(),
                    SizedBox(
                      height: height,
                    ),
                    const TurnCW(),
                    SizedBox(
                      height: height,
                    ),
                    const TurnCCW(),
                    SizedBox(
                      height: height,
                    ),
                    const GoTo(),
                    SizedBox(
                      height: height,
                    ),
                    const GoToXY(),
                    SizedBox(
                      height: height,
                    ),
                    const Glide(),
                    SizedBox(
                      height: height,
                    ),
                    const GlideXY(),
                    SizedBox(
                      height: height,
                    ),
                    const PointDirection(),
                    SizedBox(
                      height: height,
                    ),
                    const PointTowards(),
                    SizedBox(
                      height: height,
                    ),
                    const ChangeX(),
                    SizedBox(
                      height: height,
                    ),
                    const ChangeY(),
                    SizedBox(
                      height: height,
                    ),
                    const SetX(),
                    SizedBox(
                      height: height,
                    ),
                    const SetY(),
                    SizedBox(
                      height: height,
                    ),
                    const EdgeBounce(),
                    SizedBox(
                      height: height,
                    ),
                    const XPosition(),
                    SizedBox(
                      height: height,
                    ),
                    const YPosition(),
                    SizedBox(
                      height: height,
                    ),
                    const DirectionBlock(),
                    const SizedBox(height: 20.0,),
                    const Text(
                      "Looks",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    const SaySeconds()
                  ],
                ),
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

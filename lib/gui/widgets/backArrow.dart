import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../appThemes.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
              "assets/icons/back.svg",
              color: Colors.white,
              semanticsLabel: "icon--back"
          ),
          Text("Back", style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}

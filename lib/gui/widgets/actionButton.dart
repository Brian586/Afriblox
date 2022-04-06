import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  final Function()? onPressed;
  final String? imageUrl;
  const ActionButton({Key? key, this.onPressed, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0)
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
        ),
        elevation: 10.0,
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: SvgPicture.asset(imageUrl!, width: 30.0, height: 30.0,),
      ),
    );
  }
}

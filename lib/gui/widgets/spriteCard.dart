import 'package:afriblox/gui/model/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpriteCard extends StatefulWidget {
  final Sprite? sprite;

  const SpriteCard({Key? key, this.sprite}) : super(key: key);

  @override
  State<SpriteCard> createState() => _SpriteCardState();
}

class _SpriteCardState extends State<SpriteCard> {
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {

    bool isSvg = widget.sprite!.costumes![0]["dataFormat"] == "svg";
    String imageUrl = "assets/static/${widget.sprite!.costumes![0]["md5ext"]}";
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onHover: (v) {
          setState(() {
            isHighlighted = v;
          });
        },
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0,
                    spreadRadius: 2.0
                )
              ],
              border: Border.all(
                color: isHighlighted ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
                width: 1.5,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: isSvg ? SvgPicture.asset(
                      imageUrl,
                      width: size.width,
                      fit: BoxFit.contain,
                      semanticsLabel: widget.sprite!.name
                  ) : Image.asset(imageUrl, width: size.width, fit: BoxFit.cover,),
                ),
              ),
              //const SizedBox(height: 5.0,),
              Text(widget.sprite!.name!, style: const TextStyle(fontWeight: FontWeight.w600),),
              const SizedBox(height: 5.0,),
            ],
          ),
        ),
      ),
    );
  }
}

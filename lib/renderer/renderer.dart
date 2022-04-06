import 'package:afriblox/gui/model/backdrop.dart';
import 'package:afriblox/providers/backdropsProvider.dart';
import 'package:afriblox/providers/spritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../gui/model/sprite.dart';

class AfribloxRenderer extends StatefulWidget {
  const AfribloxRenderer({Key? key}) : super(key: key);

  @override
  _AfribloxRendererState createState() => _AfribloxRendererState();
}

class _AfribloxRendererState extends State<AfribloxRenderer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Backdrop> backdrops = context.watch<BackdropsProvider>().selectedBackdrops;
    List<Sprite> sprites = context.watch<SpritesProvider>().selectedSprites;

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
        child: Stack(
          children: [
            Stack(
              children: List.generate(backdrops.length, (index) {
                Backdrop backdrop = backdrops[index];
                bool isSvg = backdrop.md5!.split(".").last == "svg";
                String imageUrl = "assets/static/${backdrop.md5}";

                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: isSvg ? SvgPicture.asset(
                      imageUrl,
                      width: size.width,
                      height: size.height,
                      fit: BoxFit.cover,
                      semanticsLabel: backdrop.name
                  ) : Image.asset(imageUrl, width: size.width,  height: size.height,fit: BoxFit.cover,),
                );
              }),
            ),
            Stack(
              children: List.generate(sprites.length, (index) {
                Sprite sprite = sprites[index];
                bool isSvg = sprite.costumes![0]["dataFormat"] == "svg";
                String imageUrl = "assets/static/${sprite.costumes![0]["md5ext"]}";

                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: isSvg ? SvgPicture.asset(
                      imageUrl,
                      semanticsLabel: sprite.name
                  ) : Image.asset(imageUrl,),
                );
              },
            )
            )
          ],
        ),
      ),
    );
  }
}

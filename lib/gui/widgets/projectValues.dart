import 'package:afriblox/gui/model/sprite.dart';
import 'package:afriblox/gui/pages/backdropsPage.dart';
import 'package:afriblox/gui/pages/spritesPage.dart';
import 'package:afriblox/gui/widgets/actionButton.dart';
import 'package:afriblox/gui/widgets/customTextField.dart';
import 'package:afriblox/providers/backdropsProvider.dart';
import 'package:afriblox/providers/spritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../model/backdrop.dart';


class ProjectValues extends StatefulWidget {
  const ProjectValues({ Key? key }) : super(key: key);

  @override
  State<ProjectValues> createState() => _ProjectValuesState();
}

class _ProjectValuesState extends State<ProjectValues> {
  TextEditingController name = TextEditingController();
  TextEditingController x = TextEditingController();
  TextEditingController y = TextEditingController();
  TextEditingController spriteSize = TextEditingController();
  TextEditingController direction = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Backdrop> backdrops = context.watch<BackdropsProvider>().selectedBackdrops;
    List<Sprite> sprites = context.watch<SpritesProvider>().selectedSprites;
    bool isSvg = backdrops.last.md5!.split(".").last == "svg";
    String imageUrl = "assets/static/${backdrops.last.md5}";

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                border: Border.all(color: Colors.grey, width: 0.5)
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Sprite", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.0),),
                                      const SizedBox(width: 5.0,),
                                      ValueTextField(
                                        controller: name,
                                        width: size.width*0.07,
                                        hintText: "Name",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5.0,),
                                  Row(
                                    children: [
                                      const Text("x", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.0),),
                                      const SizedBox(width: 5.0,),
                                      ValueTextField(
                                        controller: x,
                                        width: size.width*0.035,
                                        hintText: "",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5.0,),
                                  Row(
                                    children: [
                                      const Text("y", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.0),),
                                      const SizedBox(width: 5.0,),
                                      ValueTextField(
                                        controller: y,
                                        width: size.width*0.035,
                                        hintText: "",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text("Show", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.0),),
                                      const SizedBox(width: 5.0,),
                                      Container(
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3.0),
                                          border: Border.all(
                                            width: 0.3,
                                            color: Colors.grey
                                          )
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.visibility_outlined, color: Colors.grey, size: 16,),
                                              ),
                                              const VerticalDivider(color: Colors.grey, width: 0.01,),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.visibility_off_outlined, color: Colors.grey,size: 16,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5.0,),
                                  Row(
                                    children: [
                                      const Text("Size", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.0),),
                                      const SizedBox(width: 5.0,),
                                      ValueTextField(
                                        controller: spriteSize,
                                        width: size.width*0.035,
                                        hintText: "",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5.0,),
                                  Row(
                                    children: [
                                      const Text("direction", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.0),),
                                      const SizedBox(width: 5.0,),
                                      ValueTextField(
                                        controller: direction,
                                        width: size.width*0.035,
                                        hintText: "",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(color: Colors.grey, height: 0.3,),
                  Expanded(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 4,
                            children: List.generate(sprites.length, (index) {
                              Sprite sprite = sprites[index];
                              bool spriteIsSvg = sprite.costumes![0]["dataFormat"] == "svg";
                              String spriteImage = "assets/static/${sprite.costumes![0]["md5ext"]}";

                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Stack(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7.0),
                                            border: Border.all(
                                                color: Theme.of(context).primaryColor.withOpacity(0.4),
                                                width: 4.0
                                            )
                                        ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: Theme.of(context).primaryColor,
                                            width: 1.0
                                          )
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: spriteIsSvg ? SvgPicture.asset(
                                                  spriteImage,
                                                  semanticsLabel: sprite.name
                                              ) : Image.asset(spriteImage,),
                                            ),
                                            Container(
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5.0)),
                                                color: Theme.of(context).primaryColor,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Center(child: Text(sprite.name!, style: const TextStyle(fontSize: 10.0, color: Colors.white),)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 20.0,
                                          width: 20.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Theme.of(context).primaryColor,
                                              border: Border.all(color: Colors.grey, width: 0.5)
                                          ),
                                          child: Icon(Icons.clear, color: Colors.white, size: 10.0,),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        Positioned(
                          bottom: 10.0,
                          right: 10.0,
                          child: ActionButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SpritesPage()));
                            },
                            imageUrl: "assets/icons/sprite.svg",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 5.0,),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                  border: Border.all(color: Colors.grey, width: 0.5)
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              context.read<BackdropsProvider>().switchToBackdropPaintTab(true);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: isSvg ? SvgPicture.asset(
                                  imageUrl,
                                  width: size.width,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                  semanticsLabel: backdrops.last.name
                              ) : Image.asset(imageUrl, width: size.width,  height: 60.0,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                        Text("Backdrops"),
                        Text(context.watch<BackdropsProvider>().selectedBackdrops.length.toString()),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: ActionButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const BackdropsPage()));
                      },
                      imageUrl: "assets/icons/backdrop.svg",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:afriblox/gui/pages/costumesPage.dart';
import 'package:afriblox/gui/widgets/actionButton.dart';
import 'package:afriblox/paint/models/paintTool.dart';
import 'package:afriblox/providers/backdropsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../gui/model/backdrop.dart';
import '../gui/widgets/customTextField.dart';


class AfribloxPaint extends StatefulWidget {
  const AfribloxPaint({Key? key}) : super(key: key);

  @override
  _AfribloxPaintState createState() => _AfribloxPaintState();
}

class _AfribloxPaintState extends State<AfribloxPaint> {
  TextEditingController name = TextEditingController();
  String selectedTool = "Select";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool isBackdropTab = context.watch<BackdropsProvider>().showBackdropPaintTab;
    List<Backdrop> backdrops = context.watch<BackdropsProvider>().selectedBackdrops;


    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: size.width*0.08,
                height: size.height,
                //color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: List.generate(backdrops.length, (index) {
                        Backdrop backdrop = backdrops[index];
                        bool isSvg = backdrop.md5!.split(".").last == "svg";
                        String imageUrl = "assets/static/${backdrop.md5}";

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            height: 90.0,
                            //width: size.width,
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
                                    child: isSvg ? SvgPicture.asset(
                                        imageUrl,
                                      fit: BoxFit.cover,
                                    ) : Image.asset(imageUrl, fit: BoxFit.cover,),
                                  ),
                                  Container(
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5.0)),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Center(child: Text(backdrop.name!, style: const TextStyle(fontSize: 10.0, color: Colors.white),)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );

                        // return  Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(5.0),
                        //     child: isSvg ? SvgPicture.asset(
                        //         imageUrl,
                        //         width: size.width,
                        //         height: 80.0,
                        //         fit: BoxFit.cover,
                        //         semanticsLabel: backdrops.last.name
                        //     ) : Image.asset(imageUrl, width: size.width,  height: 80.0,fit: BoxFit.cover,),
                        //   ),
                        // );
                      }),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                //right: 10.0,
                child: ActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const CostumesPage()));
                  },
                  imageUrl: "assets/icons/paint.svg",
                ),
              )
            ],
          ),
          const VerticalDivider(color: Colors.grey, width: 0.3,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Costume", style: TextStyle(fontWeight: FontWeight.w300),),
                      const SizedBox(width: 5.0,),
                      ValueTextField(
                        controller: name,
                        width: size.width*0.07,
                        hintText: "Name",
                      ),
                      const SizedBox(width: 10.0,),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SvgPicture.asset(
                                  "assets/icons/undo.svg",
                                  color: Colors.grey,
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                              const VerticalDivider(color: Colors.grey, width: 0.01,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SvgPicture.asset(
                                  "assets/icons/redo.svg",
                                  color: Colors.grey,
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/group.svg",
                              //color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Group", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/ungroup.svg",
                              //color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Ungroup", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/send_forward.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Forward", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/send_backward.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Backward", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/send_front.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Front", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/send_back.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Back", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Fill", style: TextStyle(fontWeight: FontWeight.w300),),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SvgPicture.asset(
                                  "assets/icons/mixed_fill.svg",
                                  //color: Colors.grey,
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                              const VerticalDivider(color: Colors.grey, width: 0.01,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(Icons.arrow_drop_down_rounded),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      const Text("Outline", style: TextStyle(fontWeight: FontWeight.w300),),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SvgPicture.asset(
                                  "assets/icons/no_fill.svg",
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                              const VerticalDivider(color: Colors.grey, width: 0.01,),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(Icons.arrow_drop_down_rounded),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0,),
                      ValueTextField(
                        controller: name,
                        width: size.width*0.045,
                        hintText: "0",
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/copy.svg",
                              //color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Copy", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/paste.svg",
                              //color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Paste", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/delete.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Delete", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/flip_horizontal.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Flip Horizontal", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/flip_vertical.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Flip Vertical", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey,),
                  Row(
                    children: [
                      SizedBox(
                        width: 80.0,
                        //height: size.height,
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          children: List.generate(paintTools.length, (index) {
                            PaintTool tool = paintTools[index];
                            bool isSelected = selectedTool == tool.name;

                            return InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  selectedTool = tool.name!;
                                });
                              },
                              child: Container(
                                height: 35.0,
                                width: 35.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: isSelected ? Theme.of(context).primaryColor : Colors.transparent
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    tool.imageUrl!,
                                    color: isSelected ? Colors.white : Colors.grey,
                                    height: 25.0,
                                    width: 25.0,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:afriblox/gui/pages/costumesPage.dart';
import 'package:afriblox/gui/widgets/actionButton.dart';
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: List.generate(backdrops.length, (index) {
                        Backdrop backdrop = backdrops[index];
                        bool isSvg = backdrop.md5!.split(".").last == "svg";
                        String imageUrl = "assets/static/${backdrop.md5}";

                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: isSvg ? SvgPicture.asset(
                                imageUrl,
                                width: size.width,
                                height: 80.0,
                                fit: BoxFit.cover,
                                semanticsLabel: backdrops.last.name
                            ) : Image.asset(imageUrl, width: size.width,  height: 80.0,fit: BoxFit.cover,),
                          ),
                        );
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
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.undo_rounded, color: Colors.grey, size: 16,),
                              ),
                              const VerticalDivider(color: Colors.grey, width: 0.01,),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.redo_rounded, color: Colors.grey,size: 16,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 5.0,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

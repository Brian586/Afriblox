import 'package:afriblox/audio/audio.dart';
import 'package:afriblox/blocks/blocks.dart';
import 'package:afriblox/gui/model/tabItem.dart';
import 'package:afriblox/gui/pages/spritesPage.dart';
import 'package:afriblox/paint/paint.dart';
import 'package:afriblox/providers/tabProvider.dart';
import 'package:afriblox/renderer/renderer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AfribloxGUI extends StatefulWidget {
  const AfribloxGUI({Key? key}) : super(key: key);

  @override
  _AfribloxGUIState createState() => _AfribloxGUIState();
}

class _AfribloxGUIState extends State<AfribloxGUI> {

  Widget displaySelectedTab(currentTab) {
    switch (currentTab) {
      case "Code":
        return const AfribloxBlocks();
      case "Costumes":
        return const AfribloxPaint();
      case "Sounds":
        return const AfribloxAudio();
      default:
        return const AfribloxBlocks();
    }
  }



  @override
  Widget build(BuildContext context) {
    String currentTab = context.watch<TabProvider>().currentTab;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SpritesPage()));
        },
      ),
      appBar: AppBar(
        //elevation: 0.0,
        toolbarHeight: 40.0,
        //backgroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset("assets/afribloxLogo.jpg", height: 30.0, fit: BoxFit.contain,),
            const SizedBox(width: 10.0,),
            InkWell(
              onTap: () {
              },
                child: Text("File", style: Theme.of(context).textTheme.button!.apply(fontWeightDelta: 2),)),
            const SizedBox(width: 10.0,),
            Text("Edit", style: Theme.of(context).textTheme.button!.apply(fontWeightDelta: 2),),
            const SizedBox(width: 10.0,),
            Text("Tutorials", style: Theme.of(context).textTheme.button!.apply(fontWeightDelta: 2),),
            const SizedBox(width: 10.0,),
            Text("Board", style: Theme.of(context).textTheme.button!.apply(fontWeightDelta: 2),),
            const SizedBox(width: 10.0,),
            Text("Connect", style: Theme.of(context).textTheme.button!.apply(fontWeightDelta: 2),),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white38
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text("Mode", style: Theme.of(context).textTheme.button!.apply(color: Colors.white, fontWeightDelta: 1),),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white,),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.language_outlined, color: Colors.white,),
          ),

        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(tabItems.length, (index) {
                      bool isSelected = tabItems[index].title! == currentTab;

                      return Container(
                        height: 35.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(7.0)),
                          border: Border.all(color: isSelected ? Theme.of(context).primaryColor : Colors.grey, width: 0.4),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              spreadRadius: 3.0,
                              blurRadius: 3.0,
                              color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.3) : Colors.transparent
                            )
                          ]
                        ),
                        child: FlatButton.icon(
                          onPressed: () {
                            context.read<TabProvider>().changeTab(tabItems[index].title!);
                          },
                          label: Text(tabItems[index].title!, style: TextStyle(color: isSelected ? Theme.of(context).primaryColor : Colors.grey),),
                          icon: Icon(tabItems[index].iconData, color: isSelected ? Theme.of(context).primaryColor : Colors.grey,),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10.0)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5
                      )
                    ),
                    child: displaySelectedTab(currentTab),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow_rounded, color: Colors.green,),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.stop_rounded, color: Colors.red,),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0
                                )
                            ),
                            child: FlatButton.icon(
                              onPressed: () {  },
                              label: const Text("Upload Firmware", style: TextStyle(color: Colors.grey),),
                              icon: const Icon(Icons.cloud_upload_outlined, color: Colors.grey,),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.auto_awesome_mosaic, color: Colors.grey,),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.auto_awesome_mosaic_outlined, color: Colors.grey,),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 65,
                        child: AfribloxRenderer(),
                      ),
                      Expanded(
                        flex: 35,
                        child: Container(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

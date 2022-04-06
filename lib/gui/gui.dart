
import 'package:afriblox/appThemes.dart';
import 'package:afriblox/audio/audio.dart';
import 'package:afriblox/blocks/blocks.dart';
import 'package:afriblox/gui/model/tabItem.dart';
import 'package:afriblox/gui/pages/backdropsPage.dart';
import 'package:afriblox/gui/pages/spritesPage.dart';
import 'package:afriblox/gui/widgets/customTextField.dart';
import 'package:afriblox/gui/widgets/modesButton.dart';
import 'package:afriblox/gui/widgets/projectValues.dart';
import 'package:afriblox/gui/widgets/settingsDialog.dart';
import 'package:afriblox/gui/widgets/signInButton.dart';
import 'package:afriblox/paint/paint.dart';
import 'package:afriblox/providers/tabProvider.dart';
import 'package:afriblox/renderer/renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class AfribloxGUI extends StatefulWidget {
  const AfribloxGUI({Key? key}) : super(key: key);

  @override
  _AfribloxGUIState createState() => _AfribloxGUIState();
}

class _AfribloxGUIState extends State<AfribloxGUI> {
  TextEditingController controller = TextEditingController();

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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
            const SizedBox(width: 15.0,),
            ProjectTitleInput(
              controller: controller,
              hintText: "My Project",
              width: size.width*0.1,
            ),
            const SizedBox(width: 10.0,),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.save_rounded, color: calculateTextColor(Theme.of(context).scaffoldBackgroundColor),),
            )
          ],
        ),
        actions: [
          const ModesButton(),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (c) {
                return const SettingsDialog();
              }
            ),
            icon: Icon(Icons.settings, color: calculateTextColor(Theme.of(context).scaffoldBackgroundColor),),
          ),
          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.language_outlined, color: calculateTextColor(Theme.of(context).scaffoldBackgroundColor),),
          ),
          const SignInButton()

        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 7,
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
                              //blurRadius: 3.0,
                              color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.3) : Colors.transparent
                            )
                          ]
                        ),
                        child: FlatButton.icon(
                          onPressed: () {
                            context.read<TabProvider>().changeTab(tabItems[index].title!);
                          },
                          label: Text(tabItems[index].title!, style: TextStyle(color: isSelected ? Theme.of(context).primaryColor : Colors.grey),),
                          icon: SvgPicture.asset(
                              tabItems[index].icon!,
                            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
                          ),
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
            flex: 3,
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
                              icon: const Icon(Icons.cloud_upload_outlined, color: Colors.grey,size: 16,),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SvgPicture.asset(
                                "assets/icons/small_stage.svg",
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SvgPicture.asset(
                                "assets/icons/large_stage.svg",
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SvgPicture.asset(
                                "assets/icons/fullscreen.svg",
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Expanded(
                        flex: 5,
                        child: AfribloxRenderer(),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                          child: ProjectValues(),
                        ),
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

import 'package:afriblox/gui/model/sound.dart';
import 'package:afriblox/gui/widgets/soundCard.dart';
import 'package:afriblox/providers/soundProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../appThemes.dart';
import '../widgets/customTextField.dart';
import '../widgets/progressWidget.dart';

class SoundsPage extends StatefulWidget {
  const SoundsPage({Key? key}) : super(key: key);

  @override
  _SoundsPageState createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage> {
  TextEditingController controller = TextEditingController();
  List<String> soundTags = [
    "All",
    "Animals",
    "Effects",
    "Loops",
    "Notes",
    "Percussion",
    "Space",
    "Sports",
    "Voice",
    "Wacky"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Sound", style: GoogleFonts.fredokaOne(),),
        centerTitle: true,
        toolbarHeight: 40.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey,),
        ),
        bottom: PreferredSize(
          preferredSize: Size(size.width, 50.0),
          child: Container(
            color: Colors.black12,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20.0,),
                    CustomTextField(
                      controller: controller,
                      hintText: "Search...",
                      width: size.width*0.2,
                      onChanged: (str) {
                        context.read<SoundProvider>().enableSearch(true, str);
                      },
                    ),
                    const VerticalDivider(color: Colors.black54,),
                    Row(
                      children: List.generate(soundTags.length, (index) {

                        bool isSelected = soundTags[index] == context.watch<SoundProvider>().soundsTag;

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () async {
                              await context.read<SoundProvider>().enableSearch(false, "");

                              context.read<SoundProvider>().changeSoundTag(soundTags[index]);
                            },
                            child: Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0
                                  )
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text(
                                    soundTags[index],
                                    style: TextStyle(
                                        color: isSelected ? Colors.white : calculateTextColor(Theme.of(context).scaffoldBackgroundColor)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Sound>>(
        future: context.watch<SoundProvider>().getSounds(context),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
          {
            return circularProgress();
          }
          else
          {

            List<Sound> soundsList = snapshot.data!;

            return GridView.count(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 7,
              children: List.generate(soundsList.length, (index) {
                Sound sound = soundsList[index];

                return SoundCard(sound: sound,);
              }),
            );
          }
        },
      ),
    );
  }
}


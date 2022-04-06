import 'package:afriblox/gui/model/sprite.dart';
import 'package:afriblox/gui/widgets/spriteCard.dart';
import 'package:afriblox/providers/spritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../appThemes.dart';
import '../widgets/customTextField.dart';
import '../widgets/progressWidget.dart';


class SpritesPage extends StatefulWidget {
  const SpritesPage({Key? key}) : super(key: key);

  @override
  _SpritesPageState createState() => _SpritesPageState();
}

class _SpritesPageState extends State<SpritesPage> {

  TextEditingController controller = TextEditingController();
  List<String> spriteTags = [
    "All",
    "Animals",
    "People",
    "Fantasy",
    "Dance",
    "Music",
    "Sports",
    "Food",
    "Fashion",
    "Letters"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Sprite", style: GoogleFonts.fredokaOne(),),
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
                        context.read<SpritesProvider>().enableSearch(true, str);
                      },
                    ),
                    const VerticalDivider(color: Colors.black54,),
                    Row(
                      children: List.generate(spriteTags.length, (index) {

                        bool isSelected = spriteTags[index] == context.watch<SpritesProvider>().spritesTag;

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () async {
                              await context.read<SpritesProvider>().enableSearch(false, "");

                              context.read<SpritesProvider>().changeSpriteTag(spriteTags[index]);
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
                                    spriteTags[index],
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
      body: FutureBuilder<List<Sprite>>(
        future: context.watch<SpritesProvider>().getSprites(context),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
          {
            return circularProgress();
          }
          else
          {

            List<Sprite> spritesList = snapshot.data!;

            return GridView.count(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 7,
              children: List.generate(spritesList.length, (index) {
                Sprite sprite = spritesList[index];

                return SpriteCard(sprite: sprite,);
              }),
            );
          }
        },
      ),
    );
  }
}



import 'package:afriblox/appThemes.dart';
import 'package:afriblox/gui/model/backdrop.dart';
import 'package:afriblox/gui/widgets/backdropCard.dart';
import 'package:afriblox/gui/widgets/customTextField.dart';
import 'package:afriblox/gui/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/backdropsProvider.dart';


class BackdropsPage extends StatefulWidget {
  const BackdropsPage({Key? key}) : super(key: key);

  @override
  _BackdropsPageState createState() => _BackdropsPageState();
}

class _BackdropsPageState extends State<BackdropsPage> {

  TextEditingController controller = TextEditingController();
  List<String> backdropTags = [
    "All",
    "Fantasy",
    "Music",
    "Sports",
    "Outdoors",
    "Indoors",
    "Space",
    "Underwater",
    "Patterns"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Backdrops", style: GoogleFonts.fredokaOne(),),
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
                        context.read<BackdropsProvider>().enableSearch(true, str);
                      },
                    ),
                    const VerticalDivider(color: Colors.black54,),
                    Row(
                      children: List.generate(backdropTags.length, (index) {

                        bool isSelected = backdropTags[index] == context.watch<BackdropsProvider>().backdropTag;

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () async {
                              await context.read<BackdropsProvider>().enableSearch(false, "");

                              context.read<BackdropsProvider>().changeBackdropTag(backdropTags[index]);
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
                                    backdropTags[index],
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
      body: FutureBuilder<List<Backdrop>>(
        future: context.watch<BackdropsProvider>().getBackdrops(context),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            {
              return circularProgress();
            }
          else
            {

              List<Backdrop> backdropsList = snapshot.data!;

              return GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 7,
                children: List.generate(backdropsList.length, (index) {
                  Backdrop backdrop = backdropsList[index];

                  return BackdropCard(backdrop: backdrop,);
                }),
              );
            }
        },
      ),
    );
  }
}

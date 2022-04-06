import 'package:afriblox/gui/model/costume.dart';
import 'package:afriblox/gui/widgets/backArrow.dart';
import 'package:afriblox/gui/widgets/costumeCard.dart';
import 'package:afriblox/providers/costumesProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../appThemes.dart';
import '../widgets/customTextField.dart';
import '../widgets/progressWidget.dart';


class CostumesPage extends StatefulWidget {
  const CostumesPage({Key? key}) : super(key: key);

  @override
  _CostumesPageState createState() => _CostumesPageState();
}

class _CostumesPageState extends State<CostumesPage> {
  TextEditingController controller = TextEditingController();
  List<String> costumeTags = [
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
        title: Text("Choose a Costume", style: GoogleFonts.fredokaOne(),),
        centerTitle: true,
        toolbarHeight: 40.0,
        leading: const BackArrow(),
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
                        context.read<CostumesProvider>().enableSearch(true, str);
                      },
                    ),
                    const VerticalDivider(color: Colors.black87,),
                    Row(
                      children: List.generate(costumeTags.length, (index) {

                        bool isSelected = costumeTags[index] == context.watch<CostumesProvider>().costumesTag;

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () async {
                              await context.read<CostumesProvider>().enableSearch(false, "");

                              context.read<CostumesProvider>().changeCostumeTag(costumeTags[index]);
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
                                    costumeTags[index],
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
      body: FutureBuilder<List<Costume>>(
        future: context.watch<CostumesProvider>().getCostumes(context),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
          {
            return circularProgress();
          }
          else
          {

            List<Costume> costumesList = snapshot.data!;

            return GridView.count(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 7,
              children: List.generate(costumesList.length, (index) {
                Costume costume = costumesList[index];

                return CostumeCard(costume: costume,);
              }),
            );
          }
        },
      ),
    );
  }
}

import 'package:afriblox/appThemes.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';


class SettingsDialog extends StatefulWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle titleStyle = Theme.of(context).textTheme.titleMedium!;
    TextStyle bodyStyle = Theme.of(context).textTheme.caption!;

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(
              Radius.circular(10.0))),
      title: Text('Settings', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Theme.of(context).primaryColor),),
      content: SizedBox(
        width: size.width*0.6,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Getting started with Afriblox", style: titleStyle,),
              Text("Watch Tutorials on how to use Afriblox App", style: bodyStyle,),
              const SizedBox(height: 20.0,),
              Text("Appearance", style: titleStyle,),
              Text("Change the appearance of your app.", style: bodyStyle,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Light"),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Light + Red",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.lightRed);
                      },
                      theme: Colors.white,
                      primary: Colors.red,
                    ),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Light + Pink",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.lightPink);
                      },
                      theme: Colors.white,
                      primary: Colors.pink,
                    ),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Light + Blue",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.lightBlue);
                      },
                      theme: Colors.white,
                      primary: Colors.blue,
                    ),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Light + Green",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.lightGreen);
                      },
                      theme: Colors.white,
                      primary: Colors.green,
                    ),
                    const SizedBox(height: 5.0,),
                    Text("Dark"),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Dark + Red",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.darkRed);
                      },
                      theme: Colors.black45,
                      primary: Colors.red,
                    ),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Dark + Pink",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.darkPink);
                      },
                      theme: Colors.black45,
                      primary: Colors.pink,
                    ),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Dark + Blue",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.darkBlue);
                      },
                      theme: Colors.black45,
                      primary: Colors.blue,
                    ),
                    const SizedBox(height: 5.0,),
                    ThemeSelection(
                      title: "Dark + Green",
                      onTap: () {
                        DynamicTheme.of(context)!.setTheme(AppThemes.darkGreen);
                      },
                      theme: Colors.black45,
                      primary: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Text("Feedback & Review", style: titleStyle,),
              Text("Write a feedback to the Afriblox Team", style: bodyStyle,),
              const SizedBox(height: 20.0,),
              Text("Check For Updates", style: titleStyle,),
            ],
          ),
        ),
      ),
    );
  }
}
class ThemeSelection extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? theme;
  final Color? primary;

  const ThemeSelection({Key? key, this.title, this.onTap, this.theme, this.primary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
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
                  Container(height: 35.0, width: 35.0, color: theme,),
                  const VerticalDivider(color: Colors.grey, width: 0.01,),
                  Container(height: 35.0, width: 35.0, color: primary,),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10.0,),
          Text(title!)
        ],
      ),
    );
  }
}


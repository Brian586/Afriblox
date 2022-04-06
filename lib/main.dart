import 'dart:async';

import 'package:afriblox/config.dart';
import 'package:afriblox/gui/gui.dart';
import 'package:afriblox/providers/backdropsProvider.dart';
import 'package:afriblox/providers/costumesProvider.dart';
import 'package:afriblox/providers/soundProvider.dart';
import 'package:afriblox/providers/spritesProvider.dart';
import 'package:afriblox/providers/tabProvider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'appThemes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize("afriblox-f1c33");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BackdropsProvider>(
          create: (_) => BackdropsProvider()),
      ChangeNotifierProvider<SpritesProvider>(
          create: (_) => SpritesProvider()),
      ChangeNotifierProvider<CostumesProvider>(
          create: (_) => CostumesProvider()),
      ChangeNotifierProvider<SoundProvider>(
          create: (_) => SoundProvider()),
      ChangeNotifierProvider<TabProvider>(
          create: (_) => TabProvider()),
    ],
    child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor
    ));

    return DynamicTheme(
      themeCollection: themeCollection,
      defaultThemeId: AppThemes.darkBlue,
      builder: (context, theme) {
        return MaterialApp(
          title: Afriblox.appName,
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          SizedBox(
              height: size.height,
              width: size.width,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: size.width,
              height: size.height*0.3,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black87, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  )
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                  style: GoogleFonts.fredokaOne(color: Colors.white, fontSize: 30.0),
                  child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
                    TyperAnimatedText("Welcome to Afriblox"),
                  ]),
                ),
                const SizedBox(height: 10.0,),
                const Divider(color: Colors.white, thickness: 2.0,),
                const SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: Text("Login", style: Theme.of(context).textTheme.bodyLarge,),
                      icon: const Icon(Icons.login, color: Colors.white,),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text("Settings", style: Theme.of(context).textTheme.bodyLarge,),
                      icon: const Icon(Icons.settings, color: Colors.white,),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AfribloxGUI()));
                      },
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      child: Text("Launch", style: GoogleFonts.fredokaOne(color: Colors.white),),
                      elevation: 5.0,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
import 'package:rive/rive.dart' as rive;

import 'appThemes.dart';
import 'gui/widgets/settingsDialog.dart';

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
      defaultThemeId: AppThemes.darkRed,
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

  // Controller for playback
  late rive.RiveAnimationController _controller;
  late rive.RiveAnimationController _settingsController;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = rive.SimpleAnimation('Animation 1');
    _settingsController = rive.SimpleAnimation('active');
  }
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
            child: rive.RiveAnimation.asset(
              'assets/sky_diver.riv',
              controllers: [_controller],
              fit: BoxFit.cover,
              // Update the play state when the widget's initialized
              onInit: (_) => setState(() {}),
            ),
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
                      label: Text("Login", style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white),),
                      icon: const Icon(Icons.login, color: Colors.white,),
                    ),
                    TextButton.icon(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (c) {
                            return const SettingsDialog();
                          }
                      ),
                      label: Text("Settings", style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white),),
                      icon: SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: rive.RiveAnimation.asset(
                          'assets/settings.riv',
                          controllers: [_settingsController],
                          fit: BoxFit.contain,
                          // Update the play state when the widget's initialized
                          onInit: (_) => setState(() {}),
                        ),
                      ),
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

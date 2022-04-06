import 'package:afriblox/appThemes.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class SignInButton extends StatefulWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  // Controller for playback
  late rive.RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = rive.SimpleAnimation('active');
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (v) {
        setState(() {
          _controller.isActive = v;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30.0,
            width: 30.0,
            color: Theme.of(context).primaryColor,
            child: rive.RiveAnimation.asset(
              'assets/animated_icon.riv',
              controllers: [_controller],
              // Update the play state when the widget's initialized
              onInit: (_) => setState(() {}),
            ),
          ),
          const SizedBox(width: 5.0,),
          Text("Sign In", style: TextStyle(color: calculateTextColor(Theme.of(context).scaffoldBackgroundColor)),)
        ],
      ),
    );
  }
}

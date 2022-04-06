import 'package:afriblox/gui/pages/soundsPage.dart';
import 'package:flutter/material.dart';


class AfribloxAudio extends StatefulWidget {
  const AfribloxAudio({Key? key}) : super(key: key);

  @override
  _AfribloxAudioState createState() => _AfribloxAudioState();
}

class _AfribloxAudioState extends State<AfribloxAudio> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: size.height,
                width: 60.0,
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SoundsPage()));
                  },
                  child: const Icon(Icons.volume_up_rounded, color: Colors.white,),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}

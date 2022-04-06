import 'package:afriblox/gui/model/sound.dart';
import 'package:flutter/material.dart';

class SoundCard extends StatefulWidget {
  final Sound? sound;

  const SoundCard({Key? key, this.sound}) : super(key: key);

  @override
  _SoundCardState createState() => _SoundCardState();
}

class _SoundCardState extends State<SoundCard> {
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onHover: (v) {
          setState(() {
            isHighlighted = v;
          });
        },
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0,
                    spreadRadius: 2.0
                )
              ],
              border: Border.all(
                color: isHighlighted ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
                width: 1.5,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: Icon(Icons.volume_up_rounded, color: Colors.grey, size: 20.0,),
              ),
              //const SizedBox(height: 5.0,),
              Text(widget.sound!.name!, style: const TextStyle(fontWeight: FontWeight.w600),),
              const SizedBox(height: 5.0,),
            ],
          ),
        ),
      ),
    );
  }
}

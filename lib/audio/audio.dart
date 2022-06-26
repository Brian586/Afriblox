import 'dart:io';

import 'package:afriblox/gui/pages/soundsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wav/wav.dart';

import '../gui/widgets/actionButton.dart';
import '../gui/widgets/customTextField.dart';


class AfribloxAudio extends StatefulWidget {
  const AfribloxAudio({Key? key}) : super(key: key);

  @override
  _AfribloxAudioState createState() => _AfribloxAudioState();
}

class _AfribloxAudioState extends State<AfribloxAudio> {
  TextEditingController name = TextEditingController();
  List<double> samples = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    readAudioFile();
  }

  readAudioFile() async {
    setState(() {
      loading = true;
    });

    File file = File("assets/static/9cd340d9d568b1479f731e69e103b3ce.wav");

    final bytes = await file.readAsBytes();

    var shorts = bytes.buffer.asInt16List();

    //print(shorts);

    print(shorts.length);

    var finalList = shorts.toList();

    finalList.forEach((element) {
      samples.add(element.toDouble());
    });

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: size.width*0.08,
                height: size.height,
                //color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                child: ActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SoundsPage()));
                  },
                  imageUrl: "assets/icons/add_sound.svg",
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Sound", style: TextStyle(fontWeight: FontWeight.w300),),
                      const SizedBox(width: 5.0,),
                      ValueTextField(
                        controller: name,
                        width: size.width*0.07,
                        hintText: "Name",
                      ),
                      const SizedBox(width: 10.0,),
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
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/undo.svg",
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const VerticalDivider(color: Colors.grey, width: 0.01,),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/redo.svg",
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_copy.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Copy", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_paste.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Paste", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/copy_to_new.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Copy to new", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_delete.svg",
                              color: Theme.of(context).primaryColor,
                              height: 25.0,
                              width: 25.0,
                            ),
                            const Text("Delete", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Container(
                    height: 350.0,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                            width: 0.3,
                            color: Theme.of(context).primaryColor
                        )
                    ),
                      child: loading ? Text("Loading...") : Center(
                        child: PolygonWaveform(
                        samples: samples,
                        style: PaintingStyle.fill,
                        inactiveColor: Theme.of(context).primaryColor,
                        activeColor: Theme.of(context).primaryColor,
                        height: 250.0,
                        width: 700.0,
                    ),
                      ),
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    children: [
                      ActionButton(
                        onPressed: () {},
                        imageUrl: "assets/icons/play.svg",
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/fast_foward.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Faster", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/fast_rewind.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Slower", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_louder.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Louder", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_softer.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Softer", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/mute.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Mute", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_fade_in.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Fade In", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_fade_out.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Fade Out", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_reverse.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Reverse", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/sound_robot.svg",
                              color: Theme.of(context).primaryColor,
                            ),
                            const Text("Robot", style: TextStyle(fontSize: 11.0),)
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

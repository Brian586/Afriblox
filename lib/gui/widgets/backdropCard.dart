import 'package:afriblox/gui/model/backdrop.dart';
import 'package:afriblox/providers/backdropsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class BackdropCard extends StatefulWidget {
  final Backdrop? backdrop;
  const BackdropCard({Key? key, this.backdrop}) : super(key: key);

  @override
  State<BackdropCard> createState() => _BackdropCardState();
}

class _BackdropCardState extends State<BackdropCard> {
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    bool isSvg = widget.backdrop!.md5!.split(".").last == "svg";
    String imageUrl = "assets/static/${widget.backdrop!.md5}";
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onHover: (v) {
          setState(() {
            isHighlighted = v;
          });
        },
        onTap: () async {
          //print(widget.backdrop!.toMap());
          await context.read<BackdropsProvider>().addToSelectedBackdrops(widget.backdrop!);

          Navigator.pop(context);
        },
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
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: isSvg ? SvgPicture.asset(
                      imageUrl,
                      width: size.width,
                      fit: BoxFit.cover,
                      semanticsLabel: widget.backdrop!.name
                  ) : Image.asset(imageUrl, width: size.width, fit: BoxFit.cover,),
                ),
              ),
              //const SizedBox(height: 5.0,),
              Text(widget.backdrop!.name!, style: const TextStyle(fontWeight: FontWeight.w600),),
              const SizedBox(height: 5.0,),
            ],
          ),
        ),
      ),
    );
  }
}

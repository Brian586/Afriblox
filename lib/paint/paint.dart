import 'package:afriblox/gui/pages/costumesPage.dart';
import 'package:flutter/material.dart';


class AfribloxPaint extends StatefulWidget {
  const AfribloxPaint({Key? key}) : super(key: key);

  @override
  _AfribloxPaintState createState() => _AfribloxPaintState();
}

class _AfribloxPaintState extends State<AfribloxPaint> {
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
              SizedBox(
                width: 60.0,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const CostumesPage()));
                  },
                  child: const Icon(Icons.brush_rounded, color: Colors.white,),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              child: Text("Costume", style: Theme.of(context).textTheme.bodyText2,),
            ),
          )
        ],
      ),
    );
  }
}

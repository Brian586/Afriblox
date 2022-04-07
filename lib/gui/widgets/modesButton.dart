import 'package:flutter/material.dart';

class ModesButton extends StatelessWidget {
  const ModesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 35.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.withOpacity(0.5)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text("Mode", style: Theme.of(context).textTheme.button!.apply(color: Colors.white, fontWeightDelta: 1),),
              const SizedBox(width: 5.0,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed:  () {},
                        child:  Text("Upload", style: Theme.of(context).textTheme.button!.apply(color: Colors.white),),
                      ),
                      const VerticalDivider(color: Colors.white, width: 0.5,),
                      TextButton(
                        onPressed:  () {},
                        child: Text("Stage", style: Theme.of(context).textTheme.button!.apply(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

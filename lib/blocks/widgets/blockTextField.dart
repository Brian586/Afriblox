import 'package:flutter/material.dart';

class BlockTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Color? focusColor;

  const BlockTextField({Key? key, this.controller, this.focusColor}) : super(key: key);

  @override
  State<BlockTextField> createState() => _BlockTextFieldState();
}

class _BlockTextFieldState extends State<BlockTextField> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 26.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                spreadRadius: 2.0,
                //blurRadius: 3.0,
                color: isSelected ? Colors.white38 : Colors.transparent
            )
          ]
      ),
      // padding: EdgeInsets.all(8.0),
      // margin: EdgeInsets.all(10.0),
      child: Center(
        child: FocusScope(
          onFocusChange: (v) {
            setState(() {
              isSelected = v;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: TextFormField(
              controller: widget.controller,
              style: TextStyle(fontSize: 10.0, color: Colors.black),
              cursorColor: widget.focusColor,
              decoration: InputDecoration.collapsed(
                hintText: "",
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(15.0),
                //     borderSide: BorderSide(
                //       width: 1.0,
                //       color: focusColor!
                //     )
                // ),
                //prefixIcon: Icon(data, color: Colors.grey[400],),
                focusColor: widget.focusColor,
                // hintText: hintText,
                // labelText: hintText,
                //hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

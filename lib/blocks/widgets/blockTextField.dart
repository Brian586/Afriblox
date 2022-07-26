import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlockTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Color? focusColor;


  BlockTextField({Key? key, this.controller, this.focusColor}) : super(key: key);

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
        borderRadius: BorderRadius.circular(20.0),
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
              cursorWidth: 1.0,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
                // FilteringTextInputFormatter.digitsOnly//TODO Remember to add - support
              ],
              style: TextStyle(fontSize: 10.0, color: Colors.black),
              cursorColor: widget.focusColor,
              decoration: InputDecoration.collapsed(
                hintText: "",
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

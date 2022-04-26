import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? borderRadius;
  final int? maxLines;

  TextFieldWidget({Key? key, required this.textController, required this.hintText, this.borderRadius = 30, this.maxLines = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(maxLines: maxLines, controller: textController, decoration: InputDecoration(filled: true, fillColor: Colors.transparent, hintText: hintText, focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius!), borderSide: const BorderSide(color: Colors.white, width: 1)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius!), borderSide: const BorderSide(color: Colors.white, width: 1))));
  }
}

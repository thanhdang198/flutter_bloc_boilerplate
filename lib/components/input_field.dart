import 'package:flutter/material.dart';

import '../style/style.dart';


class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.hintText,
      this.focusNode,
      this.controller,
      required this.fieldName,
      this.keyboardType})
      : super(key: key);
  final String hintText;
  final String fieldName;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        focusNode: focusNode,
        cursorColor: black,
        cursorHeight: 20,
        cursorWidth: 0.5,
        decoration: InputDecoration(
            errorText: _errorText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: hintText,
            hintStyle: hintStyle,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: blueBrand, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: black5, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: red, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: black5, width: 1))));
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = controller?.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text!.isEmpty) {
      return '$fieldName không được để trống';
    }
    // if (text.length < 4) {
    //   return 'Too short';
    // }
    // return null if the text is valid
    return null;
  }
}

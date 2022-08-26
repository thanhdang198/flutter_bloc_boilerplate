import 'package:flutter/material.dart';

import '../style/style.dart';

showMessage(BuildContext context, String content, {Color? color}) {
  Size _size = MediaQuery.of(context).size;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: transparent,
      elevation: 0,
      content: Container(
          alignment: Alignment.center,
          height: 52,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          margin: EdgeInsets.only(
              left: _size.width * 0.0773,
              right: _size.width * 0.0773,
              bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: color ?? black1),
          child: Text(
            content,
            style: bodyMedium.copyWith(color: white),
          ))));
}

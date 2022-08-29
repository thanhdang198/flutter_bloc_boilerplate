import 'package:flutter/material.dart';
import '../style/style.dart';

class BrandButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const BrandButton({Key? key, required this.onPressed, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      decoration: brandButton,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
            //make color or elevated button transparent
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}

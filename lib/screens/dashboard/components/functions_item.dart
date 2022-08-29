import 'package:flutter/material.dart';

class DashboardFunctionItem extends StatelessWidget {
  const DashboardFunctionItem(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.title})
      : super(key: key);
  final Widget icon;
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 3,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 40),
                alignment: Alignment.center,
                width: 50,
                height: 50,
                child: icon,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF4880FF))),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}

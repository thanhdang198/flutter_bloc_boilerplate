import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gopage_pos/utils/route.dart';

import '../../style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size size;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushNamed(context, Routers.login));
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Material(
        child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(gradient: splashGradient),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.375,
                ),
                const SizedBox(width: 92, height: 83, child: FlutterLogo()),
                const SizedBox(height: 30),
                const SpinKitChasingDots(color: white, size: 30)
              ],
            )),
      ),
    );
  }
}

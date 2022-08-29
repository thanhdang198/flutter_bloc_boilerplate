import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../style/style.dart';

class POSAppBar extends PreferredSize {
  final String title;
  final List<Widget> actions;
  final VoidCallback? onBackPressed;
  final double? height;
  final PreferredSize? bottom;
  POSAppBar({
    Key? key,
    this.bottom,
    this.onBackPressed,
    required this.title,
    required this.actions,
    this.height,
  }) : super(
            key: key,
            child: const SizedBox.shrink(),
            preferredSize: Size.fromHeight(height ?? 90));
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      iconTheme: const IconThemeData(
        color: blueBrand, //change your color here
      ),
      backgroundColor: Colors.white,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: h1,
      ),
      actions: actions,
      // [IconButton(onPressed: () {}, icon: const Svg('icon_search'))],
      shadowColor: Colors.black12,
      bottom: bottom,
    );
  }
}

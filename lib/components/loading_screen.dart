import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../style/style.dart';
import 'loading_bar.dart';
import 'loading_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            10,
            (index) => index == 0
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 10, left: 16),
                    child: Shimmer.fromColors(
                      period: const Duration(milliseconds: 4000),
                      baseColor: const Color(0xFFEAEBF0),
                      highlightColor: white,
                      child: const LoadingBar(
                        width: 84,
                        height: 10,
                      ),
                    ))
                : LoadingWidget(
                    index: index,
                  )));
  }
}

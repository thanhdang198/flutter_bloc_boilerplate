import 'package:flutter/foundation.dart';
import 'dart:async';

class SearchDebounce {
  final int? milliseconds;
  Timer? _timer;

  SearchDebounce({this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds ?? 500), action);
  }
}

import 'package:flutter/material.dart';

import '../plugins/app_localizations.dart';

extension StringExtension on String {
  translate(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}

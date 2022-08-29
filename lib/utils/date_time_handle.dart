library date_time_handle;

import 'package:intl/intl.dart';

getDateTime() {
  return DateFormat('dd-MM-yyyy – kk:mm').format(DateTime.now());
}

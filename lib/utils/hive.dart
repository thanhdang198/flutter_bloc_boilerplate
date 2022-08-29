import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  writeData({required String key, required dynamic data}) async {
    Box _box = await Hive.openBox('gopage-pos');
    _box.put(key, data);
  }

  Future<dynamic> getData({required String key}) async {
    Box _box = await Hive.openBox('gopage-pos');
    return _box.get(key) ?? '';
  }

  clearData() async {
    Box _box = await Hive.openBox('gopage-pos');
    await _box.clear();
  }
}

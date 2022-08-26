import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  writeData({required String key, required dynamic data}) async {
    Box _box = await Hive.openBox('gocallData');
    _box.put(key, data);
  }

  Future<dynamic> getData({required String key}) async {
    Box _box = await Hive.openBox('gocallData');
    return _box.get(key) ?? '';
  }

  clearData() async {
    Box _box = await Hive.openBox('gocallData');
    await _box.clear();
    await HiveData().writeData(key: 'autoStart', data: true);
  }
}

import 'package:get_storage/get_storage.dart';

class StorageGetterSetters {
  static final StorageGetterSetters _instance = StorageGetterSetters._();
  final GetStorage _storage = GetStorage();

  factory StorageGetterSetters() {
    return _instance;
  }

  StorageGetterSetters._();

  Future<void> init() async {
    await GetStorage.init(); // Initialize GetStorage
  }

  Future<void> setData(String key, String value) async {
    await _storage.write(key, value);
  }

  String? getData(String key) {
    return _storage.read<String>(key);
  }

  Future<void> clearKey(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}

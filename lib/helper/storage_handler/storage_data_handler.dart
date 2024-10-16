import 'package:galleon_user/helper/storage_handler/storage_getters_setters.dart';
import 'package:galleon_user/helper/storage_handler/storage_synonyms.dart';

abstract class StorageDataHandler {
  static final StorageGetterSetters storage = StorageGetterSetters();

  // Set User UID
  static Future<void> setUserUid({required String uid}) async {
    await storage.setData(StorageSynonyms.userId, uid);
  }

  // Get User UID
  static Future<String?> getUserId() async {
    String? userId = storage.getData(StorageSynonyms.userId);
    return userId;
  }

  // Delete User UID
  static Future<void> deleteUserUid() async {
    await storage.clearKey(StorageSynonyms.userId);
  }
}

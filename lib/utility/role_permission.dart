import '../constant/app_states.dart';

enum UserRole {
  admin("admin"),
  client("client"),
  manager("manager"),
  consultant("consultant");

  final String type;

  const UserRole(this.type);

  @override
  String toString() {
    super.toString();
    return "UserRole name is: $type";
  }
}

class RolePermissions {
  static Map<UserRole, List<String>> roleFeatures = {
    UserRole.admin: [
      Features.createStudy,
      Features.manageStudies,
      Features.viewPositions,
      Features.addPositions,
      Features.deleteStudies,
    ],
    UserRole.manager: [
      Features.createStudy,
      Features.manageStudies,
      Features.viewPositions,
      Features.addPositions,
      Features.deleteStudies,
    ],
    UserRole.consultant: [
      Features.createStudy,
      Features.manageStudies,
      Features.viewPositions,
      Features.deleteStudies,
    ],
    UserRole.client: [
      Features.createStudy,
      Features.manageStudies,
    ],
  };
}

bool hasAccessFeature(String featureName) {
  if (currentUserRole != null) {
    return _hasAccessToFeature(currentUserRole!, featureName);
  } else {
    return false;
  }
}

bool _hasAccessToFeature(UserRole role, String featureName) {
  return RolePermissions.roleFeatures[role]?.contains(featureName) ?? false;
}

class Features {
  static const String createStudy = "createStudy";
  static const String manageStudies = "manageStudies";
  static const String viewPositions = "viewPositions";
  static const String addPositions = "addPositions";
  static const String deleteStudies = "deleteStudies";
}

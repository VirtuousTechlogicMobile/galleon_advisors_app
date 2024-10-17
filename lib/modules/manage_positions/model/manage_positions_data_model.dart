class ManagePositionsDataModel {
  String positionId;
  String? deptName;
  String? positionName;
  String status;
  List<String>? serviceActivities;
  List<String>? oppThemes;

  ManagePositionsDataModel({
    required this.positionId,
    required this.status,
    this.deptName,
    this.positionName,
    this.serviceActivities,
    this.oppThemes,
  });
}

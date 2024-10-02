class ManageStudiesDataModel {
  String departmentName;
  String positionName;
  List<StudyDataModel> studyData;
  ManageStudiesDataModel({
    required this.departmentName,
    required this.positionName,
    required this.studyData,
  });
}

class StudyDataModel {
  String studyId;
  String studyName;
  bool isStart;
  StudyDataModel({
    required this.studyId,
    required this.studyName,
    required this.isStart,
  });
}

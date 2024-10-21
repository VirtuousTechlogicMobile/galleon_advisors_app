class StudyTaskTimelineDataModel {
  String? id;
  DateTime? startTime;
  DateTime? endTime;
  String? studyId;
  String? taskName;
  String? assignStatus;
  DateTime? lastChangedAt;
  String? lastChangedBy;
  num? volume;
  String? type;
  String? oppFlagId;
  String? comment;
  String? identifier;
  String? taskId;

  StudyTaskTimelineDataModel({
    this.id,
    this.startTime,
    this.endTime,
    this.studyId,
    this.taskName,
    this.assignStatus,
    this.lastChangedAt,
    this.lastChangedBy,
    this.volume,
    this.type,
    this.oppFlagId,
    this.comment,
    this.identifier,
    this.taskId,
  });
}

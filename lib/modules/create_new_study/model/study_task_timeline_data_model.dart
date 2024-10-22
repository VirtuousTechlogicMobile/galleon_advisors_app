import 'package:cloud_firestore/cloud_firestore.dart';

class StudyTaskTimelinesDataModel {
  String? id;
  DateTime? startTime;
  DateTime? endTime;
  String? studyId;
  String? taskName;
  String? assignStatus;
  DateTime? lastUpdatedAt;
  String? lastUpdatedBy;
  num? volume;
  String? type;
  String? oppFlagId;
  String? comment;
  String? identifier;
  String? taskId;

  StudyTaskTimelinesDataModel({
    this.id,
    this.startTime,
    this.endTime,
    this.studyId,
    this.taskName,
    this.assignStatus,
    this.lastUpdatedAt,
    this.lastUpdatedBy,
    this.volume,
    this.type,
    this.oppFlagId,
    this.comment,
    this.identifier,
    this.taskId,
  });

  factory StudyTaskTimelinesDataModel.fromMap(Map<String, dynamic> map, {String? studyTimelineId}) {
    return StudyTaskTimelinesDataModel(
      id: studyTimelineId,
      startTime: map['start_time'] != null ? (map['start_time'] as Timestamp).toDate() : null,
      endTime: map['end_time'] != null ? (map['end_time'] as Timestamp).toDate() : null,
      studyId: map['study_id'],
      taskName: map['task_name'],
      assignStatus: map['assign_status'],
      lastUpdatedAt: map['last_updated_at'] != null ? (map['last_updated_at'] as Timestamp).toDate() : null,
      lastUpdatedBy: map['last_updated_by'],
      volume: map['volume'],
      type: map['type'],
      oppFlagId: map['opportunity_flag_id'],
      comment: map['comment'],
      identifier: map['identifier'],
      taskId: map['task_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start_time': startTime != null ? Timestamp.fromDate(startTime!) : null,
      'end_time': endTime != null ? Timestamp.fromDate(endTime!) : null,
      'study_id': studyId,
      'task_name': taskName,
      'assign_status': assignStatus,
      'last_updated_at': lastUpdatedAt,
      'last_updated_by': lastUpdatedBy,
      'volume': volume,
      'type': type,
      'opportunity_flag_id': oppFlagId,
      'comment': comment,
      'identifier': identifier,
      'task_id': taskId,
    };
  }
}

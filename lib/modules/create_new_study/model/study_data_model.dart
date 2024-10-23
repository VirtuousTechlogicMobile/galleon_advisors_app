import 'package:cloud_firestore/cloud_firestore.dart';

class StudyDataModel {
  String? id;
  String? programId;
  String? departmentId;
  String? positionId;
  DateTime? createdAt;
  List<DateTime?>? startTime;
  List<DateTime?>? pauseTime;
  DateTime? endTime;
  String? studyTimelineId;
  List<String>? studyTaskIds;
  String? studyBy;
  String? keyThemesFile;
  bool? isStarted;
  bool? isCompleted;
  DateTime? lastUpdatedAt;
  String? lastUpdatedBy;
  bool? isRemovedFromApp;

  StudyDataModel({
    this.id,
    this.programId,
    this.departmentId,
    this.positionId,
    this.createdAt,
    this.startTime,
    this.pauseTime,
    this.endTime,
    this.studyTimelineId,
    this.studyTaskIds,
    this.studyBy,
    this.keyThemesFile,
    this.isStarted,
    this.isCompleted,
    this.lastUpdatedAt,
    this.lastUpdatedBy,
    this.isRemovedFromApp,
  });

  factory StudyDataModel.fromMap(Map<String, dynamic> map, {String? studyTimelineId}) {
    return StudyDataModel(
      id: studyTimelineId,
      programId: map['program_id'],
      departmentId: map['department_id'],
      positionId: map['position_id'],
      createdAt: map['created_at'] != null ? (map['created_at'] as Timestamp).toDate() : null,
      startTime: (map['start_time'] as List<dynamic>?)?.map((e) => e != null ? (e as Timestamp).toDate() : null).toList(),
      pauseTime: (map['pause_time'] as List<dynamic>?)?.map((e) => e != null ? (e as Timestamp).toDate() : null).toList(),
      endTime: map['end_time'] != null ? (map['end_time'] as Timestamp).toDate() : null,
      studyTimelineId: map['study_timeline_id'],
      studyTaskIds: (map['study_task_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      studyBy: map['study_by'],
      keyThemesFile: map['key_themes_file'],
      isStarted: map['is_started'],
      isCompleted: map['is_completed'],
      lastUpdatedAt: map['last_updated_at'] != null ? (map['last_updated_at'] as Timestamp).toDate() : null,
      lastUpdatedBy: map['last_updated_by'],
      isRemovedFromApp: map['is_removed_from_app'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'program_id': programId,
      'department_id': departmentId,
      'position_id': positionId,
      'created_at': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'start_time': startTime?.map((e) => e != null ? Timestamp.fromDate(e) : null).toList(),
      'pause_time': pauseTime?.map((e) => e != null ? Timestamp.fromDate(e) : null).toList(),
      'end_time': endTime != null ? Timestamp.fromDate(endTime!) : null,
      'study_timeline_id': studyTimelineId,
      'study_task_ids': studyTaskIds,
      'study_by': studyBy,
      'key_themes_file': keyThemesFile,
      'is_started': isStarted,
      'is_completed': isCompleted,
      'last_updated_at': lastUpdatedAt != null ? Timestamp.fromDate(lastUpdatedAt!) : null,
      'last_updated_by': lastUpdatedBy,
      'is_removed_from_app': isRemovedFromApp,
    };
  }

  static Map<String, String> toFields() {
    return {
      'id': 'INTEGER PRIMARY KEY',
      'programId': 'TEXT',
      'departmentId': 'TEXT',
      'positionId': 'TEXT',
      'createdAt': 'TEXT',
      'startTime': 'TEXT',
      'pauseTime': 'TEXT',
      'endTime': 'TEXT',
      'studyTimelineId': 'TEXT',
      'studyTaskIds': 'TEXT',
      'studyBy': 'TEXT',
      'keyThemesFile': 'TEXT',
      'isStarted': 'INTEGER',
      'isCompleted': 'INTEGER',
      'lastUpdatedAt': 'TEXT',
      'lastUpdatedBy': 'TEXT',
      'isRemovedFromApp': 'INTEGER',
    };
  }
}

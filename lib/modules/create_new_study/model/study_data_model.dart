import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galleon_user/utility/utility.dart';

class StudyDataModel {
  String? id;
  String? studyName;
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
    this.studyName,
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
      studyName: map['study_name'],
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
      'study_name': programId,
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

  Map<String, dynamic> toSqlite() {
    return {
      'id': id,
      'study_name': studyName,
      'program_id': programId,
      'department_id': departmentId,
      'position_id': positionId,
      'created_at': createdAt != null ? AppUtility.fromDateToString(date: createdAt!) : null,
      'start_time': startTime != null ? AppUtility.fromDateListToSqliteString(list: startTime!) : null,
      'pause_time': pauseTime != null ? AppUtility.fromDateListToSqliteString(list: pauseTime!) : null,
      'end_time': endTime != null ? AppUtility.fromDateToString(date: endTime!) : null,
      'study_timeline_id': studyTimelineId,
      'study_task_ids': studyTaskIds?.join(","),
      'study_by': studyBy,
      'key_themes_file': keyThemesFile,
      'is_started': isStarted == true
          ? 0
          : isStarted == false
              ? 1
              : null,
      'is_completed': isCompleted == true
          ? 0
          : isCompleted == false
              ? 1
              : null,
      'last_updated_at': lastUpdatedAt != null ? AppUtility.fromDateToString(date: lastUpdatedAt!) : null,
      'last_updated_by': lastUpdatedBy,
      'is_removed_from_app': isRemovedFromApp == true
          ? 0
          : isRemovedFromApp == false
              ? 1
              : null,
    };
  }

  static Map<String, String> toFields() {
    return {
      'id': 'TEXT',
      'study_name': 'TEXT',
      'program_id': 'TEXT',
      'department_id': 'TEXT',
      'position_id': 'TEXT',
      'created_at': 'TEXT',
      'start_time': 'TEXT',
      'pause_time': 'TEXT',
      'end_time': 'TEXT',
      'study_timeline_id': 'TEXT',
      'study_task_ids': 'TEXT',
      'study_by': 'TEXT',
      'key_themes_file': 'TEXT',
      'is_started': 'INTEGER',
      'is_completed': 'INTEGER',
      'last_updated_at': 'TEXT',
      'last_updated_by': 'TEXT',
      'is_removed_from_app': 'INTEGER',
    };
  }
}

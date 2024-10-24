import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galleon_user/utility/utility.dart';

class TaskDataModel {
  String? id;
  String? taskName;
  String? assignStatus;
  String? type;
  bool? isActive;
  String? lastUpdatedBy;
  DateTime? lastUpdatedAt;
  String? taskTemplateId;

  TaskDataModel({
    this.id,
    this.taskName,
    this.assignStatus,
    this.isActive,
    this.type,
    this.lastUpdatedBy,
    this.lastUpdatedAt,
    this.taskTemplateId,
  });

  factory TaskDataModel.fromMap(Map<String, dynamic> map, {String? positionId}) {
    return TaskDataModel(
      id: positionId,
      taskName: map['position_name'],
      assignStatus: map['department_id'],
      isActive: map['is_active'],
      type: map['type'],
      lastUpdatedBy: map['last_updated_by'],
      lastUpdatedAt: map['last_updated_at'] != null ? (map['last_updated_at'] as Timestamp).toDate() : null,
      taskTemplateId: map['position_template_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'task_name': taskName,
      'assign_status': assignStatus,
      'type': type,
      'is_active': isActive,
      'last_updated_by': lastUpdatedBy,
      'last_updated_at': lastUpdatedAt != null ? Timestamp.fromDate(lastUpdatedAt!) : null,
      'position_template_id': taskTemplateId,
    };
  }

  Map<String, dynamic> toSqlite() {
    return {
      'id': id,
      'task_name': taskName,
      'assign_status': assignStatus,
      'type': type,
      'is_active': isActive == true
          ? 0
          : isActive == false
              ? 1
              : null,
      'last_updated_by': lastUpdatedBy,
      'last_updated_at': lastUpdatedAt != null ? AppUtility.fromDateToString(date: lastUpdatedAt!) : null,
      'position_template_id': taskTemplateId,
    };
  }

  static Map<String, String> toFields() {
    return {
      'id': 'TEXT',
      'task_name': 'TEXT',
      'assign_status': 'TEXT',
      'type': 'TEXT',
      'is_active': 'INTEGER',
      'last_updated_by': 'TEXT',
      'last_updated_at': 'TEXT',
      'position_template_id': 'TEXT',
    };
  }
}

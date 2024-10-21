import 'package:cloud_firestore/cloud_firestore.dart';

class PositionDataModel {
  String? id;
  String? positionName;
  String? departmentId;
  List<String>? oppFlags;
  List<String>? taskIds;
  bool? isApproved;
  DateTime? createdAt;
  String? createdBy;
  bool? isActive;
  String? lastUpdatedBy;
  DateTime? lastUpdatedAt;
  String? positionTemplateId;

  PositionDataModel({
    this.id,
    this.positionName,
    this.departmentId,
    this.oppFlags,
    this.taskIds,
    this.isApproved,
    this.createdAt,
    this.createdBy,
    this.isActive,
    this.lastUpdatedBy,
    this.lastUpdatedAt,
    this.positionTemplateId,
  });

  factory PositionDataModel.fromMap(Map<String, dynamic> map, {String? positionId}) {
    return PositionDataModel(
      id: positionId,
      positionName: map['position_name'],
      departmentId: map['department_id'],
      oppFlags: (map['opportunity_flags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      taskIds: (map['task_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isApproved: map['is_approved'],
      createdAt: map['created_at'] != null ? (map['created_at'] as Timestamp).toDate() : null,
      createdBy: map['created_by'],
      isActive: map['is_active'],
      lastUpdatedBy: map['last_updated_by'],
      lastUpdatedAt: map['last_updated_at'] != null ? (map['last_updated_at'] as Timestamp).toDate() : null,
      positionTemplateId: map['position_template_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position_name': positionName,
      'department_id': departmentId,
      'opportunity_flags': oppFlags,
      'task_ids': taskIds,
      'is_approved': isApproved,
      'created_at': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'created_by': createdBy,
      'is_active': isActive,
      'last_updated_by': lastUpdatedBy,
      'last_updated_at': lastUpdatedAt != null ? Timestamp.fromDate(lastUpdatedAt!) : null,
      'position_template_id': positionTemplateId,
    };
  }
}

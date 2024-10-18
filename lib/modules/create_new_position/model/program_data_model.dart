import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramDataModel {
  String? id;
  String? programName;
  String? selectedCategory;
  String? createdBy;
  DateTime? createdAt;
  String? lastChangedBy;
  List<String>? departmentIds;
  DateTime? lastChangedAt;

  ProgramDataModel({
    this.id,
    this.programName,
    this.selectedCategory,
    this.createdBy,
    this.createdAt,
    this.lastChangedBy,
    this.departmentIds,
    this.lastChangedAt,
  });

  factory ProgramDataModel.fromMap(Map<String, dynamic> map, {String? programId}) {
    return ProgramDataModel(
      id: programId,
      programName: map['program_name'],
      selectedCategory: map['selected_category'],
      createdBy: map['created_by'],
      createdAt: map['created_at'] != null ? (map['created_at'] as Timestamp).toDate() : null,
      lastChangedBy: map['last_changed_by'],
      lastChangedAt: map['last_changed_at'] != null ? (map['last_changed_at'] as Timestamp).toDate() : null,
      departmentIds: (map['department_ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'program_name': programName,
      'selected_category': selectedCategory,
      'created_by': createdBy,
      'created_at': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'last_changed_by': lastChangedBy,
      'last_changed_at': lastChangedAt != null ? Timestamp.fromDate(lastChangedAt!) : null,
      'department_ids': departmentIds
    };
  }
}

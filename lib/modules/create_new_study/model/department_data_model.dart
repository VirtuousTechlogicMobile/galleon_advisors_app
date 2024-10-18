class DepartmentDataModel {
  String? id;
  String? addedDate;
  String? addedBy;
  String? departmentName;

  DepartmentDataModel({
    this.id,
    this.addedDate,
    this.addedBy,
    this.departmentName,
  });

  factory DepartmentDataModel.fromMap(Map<String, dynamic> map, {String? departmentId}) {
    return DepartmentDataModel(
      id: departmentId,
      addedDate: map['added_date'],
      addedBy: map['added_by'],
      departmentName: map['department_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'added_date': addedDate,
      'added_by': addedBy,
      'department_name': departmentName,
      'template_id': '',
    };
  }
}

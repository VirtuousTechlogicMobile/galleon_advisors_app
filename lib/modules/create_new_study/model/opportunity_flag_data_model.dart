class OpportunityFlagDataModel {
  String? id;
  String? flagName;
  String? addedBy;
  String? flagTemplateId;

  OpportunityFlagDataModel({
    this.id,
    this.flagName,
    this.addedBy,
    this.flagTemplateId,
  });

  factory OpportunityFlagDataModel.fromMap(Map<String, dynamic> map, {String? oppFlagId}) {
    return OpportunityFlagDataModel(
      id: oppFlagId,
      flagName: map['flag_name'],
      addedBy: map['added_by'],
      flagTemplateId: map['flag_template_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'added_by': addedBy,
      'flag_name': flagName,
      'flag_template_id': flagTemplateId,
    };
  }
}

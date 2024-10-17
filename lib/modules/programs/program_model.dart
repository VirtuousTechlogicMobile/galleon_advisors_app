import 'package:cloud_firestore/cloud_firestore.dart';

class Program {
  String id;
  String programName;
  String selectedCategory; // Category ID
  DocumentReference selectedCategoryRef; // Reference to Category
  String createdBy;
  Timestamp createdAt;
  String lastChangedBy;
  Timestamp lastCreatedAt;

  // Constructor
  Program({
    required this.id,
    required this.programName,
    required this.selectedCategory,
    required this.selectedCategoryRef,
    required this.createdBy,
    required this.createdAt,
    required this.lastChangedBy,
    required this.lastCreatedAt,
  });

  // Factory constructor for creating a new instance from a map (deserialization)
  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'] as String,
      programName: json['program_name'] as String,
      selectedCategory: json['selected_category'] as String,
      selectedCategoryRef: json['selected_category_ref'] as DocumentReference,
      createdBy: json['created_by'] as String,
      createdAt: json['created_at'] as Timestamp,
      lastChangedBy: json['last_changed_by'] as String,
      lastCreatedAt: json['last_created_at'] as Timestamp,
    );
  }

  // Method for converting an instance to a map (serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'program_name': programName,
      'selected_category': selectedCategory,
      'selected_category_ref': selectedCategoryRef,
      'created_by': createdBy,
      'created_at': createdAt,
      'last_changed_by': lastChangedBy,
      'last_created_at': lastCreatedAt,
    };
  }
}
/*Program program = Program(
  id: '001',
  programName: 'Tech Workshop',
  selectedCategory: '123',
  selectedCategoryRef: FirebaseFirestore.instance.doc('categories/123'),
  createdBy: 'Admin',
  createdAt: Timestamp.now(),
  lastChangedBy: 'Admin',
  lastCreatedAt: Timestamp.now(),
);

// Converting to JSON
Map<String, dynamic> programJson = program.toJson();

// Creating from JSON
Program newProgram = Program.fromJson(programJson);
*/

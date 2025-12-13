// import 'dart:io';
// enum IssuePriority{low,medium,high}
// enum IssueStatus{InProgress,Submitted,pending, resolved,assigned}
// class IssueModel {
// File? photo;
// String? description;
// IssuePriority? priority;
// double? lat;
// double? lng;
// String? address;
// String? category;
// String? status;
// String? assignedToDept;
// DateTime? raisedDate;
// DateTime? resolvedDate;
// IssueModel.named({
//   this.photo,
//   this.description,
//   this.priority,
//   this.lat,
//   this.lng,
//   this.address,
//   this.category,
// });
//
// IssueModel();
//
//   Future<void> submit() async {final data=issueToMap(this); await Future.delayed(const Duration(seconds:2));}
// }
//
// Map<String, dynamic> issueToMap(IssueModel issue) => {
//   'photo': issue.photo?.path, // store file path instead of File object
//   'description': issue.description,
//   'priority': issue.priority?.toString().split('.').last, // enum to string
//   'lat': issue.lat,
//   'lng': issue.lng,
//   'address': issue.address,
//   'category': issue.category,
//   'status': issue.status,
//   'assignedToDept': issue.assignedToDept,
//   'raisedDate': issue.raisedDate?.toIso8601String(), // DateTime to string
//   'resolvedDate': issue.resolvedDate?.toIso8601String(),
// };
import 'dart:io';

enum IssuePriority { low, medium, high }

enum IssueStatus { inProgress, submitted, pending, resolved, assigned }

class IssueModel {
  File? photo;
  String? description;
  IssuePriority? priority;
  double? lat;
  double? lng;
  String? address;
  String? category;
  String? status;
  String? assignedToDept;
  DateTime? raisedDate;
  DateTime? resolvedDate;

  // Default constructor with named params
  IssueModel({
    this.photo,
    this.description,
    this.priority,
    this.lat,
    this.lng,
    this.address,
    this.category,
    this.status,
    this.assignedToDept,
    this.raisedDate,
    this.resolvedDate,
  });

  Future<void> submit() async {
    final data = issueToMap(this);
    // simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    // TODO: send `data` to backend
  }
}

Map<String, dynamic> issueToMap(IssueModel issue) => {
  'photo': issue.photo?.path,
  'description': issue.description,
  'priority': issue.priority?.toString().split('.').last,
  'lat': issue.lat,
  'lng': issue.lng,
  'address': issue.address,
  'category': issue.category,
  'status': issue.status?.toString().split('.').last,
  'assignedToDept': issue.assignedToDept,
  'raisedDate': issue.raisedDate?.toIso8601String(),
  'resolvedDate': issue.resolvedDate?.toIso8601String(),
};

import 'package:core/devolop_core.dart';

class ProjectModel extends DevolopModel {
  final String? name;
  final String? description;
  final String? status;
  final String? startDate;
  final String? endDate;

  ProjectModel({
    required id,
    required createdAt,
    required updatedAt,
    required this.name,
    this.description,
    this.status,
    this.startDate,
    this.endDate,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'name': name,
        'description': description,
        'status': status,
        'startDate': startDate,
        'endDate': endDate,
      };
}

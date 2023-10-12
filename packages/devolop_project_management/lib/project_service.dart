import 'package:core/devolop_core.dart';

import 'project_model.dart';

class ProjectService extends DevolopService<ProjectModel> {
  @override
  Future<ProjectModel> create(ProjectModel project) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel> read(String id) async {
    return ProjectModel(
      id: id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      name: 'Project',
      description: 'Project description',
      status: 'Status',
      startDate: '2021-01-01',
      endDate: '2021-01-02',
    );
  }

  @override
  Future<ProjectModel> update(ProjectModel project) async {
    return project;
  }

  @override
  Future<void> delete(String id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}

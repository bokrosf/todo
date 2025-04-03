import 'package:todo/feature/project_list/model/project_list_model.dart';

class ProjectListViewModel {
  final ProjectListModel _model;

  ProjectListViewModel({
    required ProjectListModel model,
  })
    : _model = model;
}

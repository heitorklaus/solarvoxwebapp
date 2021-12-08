// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';

import '../store/projects_engineering_store.dart';
import '../view/projects_ engineering_page.dart';
import '../service/projects_ engineering_service.dart';

class ProjectsEngineeringModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProjectsEngineeringStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProjectsEngineeringPage()),
  ];
}

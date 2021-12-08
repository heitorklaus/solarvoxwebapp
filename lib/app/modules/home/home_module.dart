import 'package:flutter_modular/flutter_modular.dart';
import 'package:solarvox/app/modules/projects_engineering/module/projects_%20engineering_module.dart';

import '../home/home_store.dart';

import '../projects_engineering/store/projects_engineering_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => ProjectsEngineeringStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ModuleRoute('/projects_engineering', module: ProjectsEngineeringModule()),
  ];
}

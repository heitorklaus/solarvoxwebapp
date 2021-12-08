import 'package:flutter_modular/flutter_modular.dart';
import 'package:solarvox/app/modules/login/login_module.dart';
import 'package:solarvox/app/modules/projects_engineering/module/projects_%20engineering_module.dart';

import 'app_controller.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/projects_engineering', module: ProjectsEngineeringModule()),
  ];
}
    //M
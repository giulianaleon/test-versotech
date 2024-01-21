import 'package:flutter_modular/flutter_modular.dart';
import 'package:versotech/app/modules/home/home_store.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => HomeStore())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];

}
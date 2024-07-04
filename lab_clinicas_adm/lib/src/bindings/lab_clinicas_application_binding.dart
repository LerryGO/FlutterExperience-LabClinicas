import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/core/env.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(Env.backendBaseUrl),
        ),
      ];
}

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_panel/src/pages/painel/painel_controller.dart';

import '../../repositories/painel_checkin/painel_checkin_repository.dart';
import '../../repositories/painel_checkin/painel_checkin_repository_impl.dart';
import 'painel_page.dart';

class PainelRouter extends FlutterGetItPageRouter {
  const PainelRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<PainelCheckinRepository>(
          (i) => PainelCheckinRepositoryImpl(
            restClient: i(),
          ),
        ),
        Bind.lazySingleton<PainelController>(
          (i) => PainelController(
            repository: i(),
          ),
        ),
      ];

  @override
  String get routeName => '/painel';

  @override
  WidgetBuilder get view => (_) => const PainelPage();
}

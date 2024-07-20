import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'painel_page.dart';

class PainelRouter extends FlutterGetItPageRouter {
  const PainelRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get routeName => '/painel';

  @override
  WidgetBuilder get view => (_) => const PainelPage();
}

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../models/patient_information_form_model.dart';
import 'pre_checkin_controller.dart';
import 'pre_checkin_page.dart';

class PreCheckinRouter extends FlutterGetItPageRouter {
  const PreCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => PreCheckinController(
            callNextPatientService: i(),
          ),
        )
      ];

  @override
  String get routeName => '/pre-checkin';

  @override
  WidgetBuilder get view => (context) {
        final form = ModalRoute.of(context)!.settings.arguments
            as PatientInformationFormModel;

        context.get<PreCheckinController>().informationForm.value = form;
        return const PreCheckinPage();
      };
}

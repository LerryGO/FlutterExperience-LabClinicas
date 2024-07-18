
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../models/patient_information_form_model.dart';
import '../../services/call_next_patient/call_next_patient_service.dart';

class PreCheckinController with MessageStateMixin {
  final CallNextPatientService _callNextPatientService;
  final informationForm = signal<PatientInformationFormModel?>(null);
  PreCheckinController({
    required CallNextPatientService callNextPatientService,
  }) : _callNextPatientService = callNextPatientService;

  Future<void> next() async {
    final result = await _callNextPatientService.execute();
    switch (result) {
      case Left():
        showError('Erro ao chamar paciente');
      case Right(value: final form?):
        informationForm.value = form;
      case Right():
        showInfo('Nenhum paciente aguardando, pode ir tomar um café');
    }
  }
}

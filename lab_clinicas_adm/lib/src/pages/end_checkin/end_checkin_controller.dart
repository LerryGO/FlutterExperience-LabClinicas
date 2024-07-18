
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../models/patient_information_form_model.dart';
import '../../services/call_next_patient/call_next_patient_service.dart';

class EndCheckinController with MessageStateMixin {
  final CallNextPatientService _callNextPatientService;
  final infomationForm = signal<PatientInformationFormModel?>(null);
  EndCheckinController({required CallNextPatientService callNextPatientService})
      : _callNextPatientService = callNextPatientService;

  Future<void> callNextPatient() async {
    final result = _callNextPatientService.execute();
    switch (result) {
      case Left():
        showError('Erro ao chamar o próximo paciente');
      case Right(value: final form?):
        infomationForm.value = form;
      case Right():
        showInfo('Nenhum paciente aguardando, pode ir tomar um café');
    }
  }
}

import 'package:lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../models/patient_information_form_model.dart';

class CheckinController with MessageStateMixin {
  final informationForm = signal<PatientInformationFormModel?>(null);
  final PatientInformationFormRepository _patientInformationFormRepository;
  final endProcess = Signal(false);

  CheckinController({
    required PatientInformationFormRepository patientInformationFormRepository,
  }) : _patientInformationFormRepository = patientInformationFormRepository;

  Future<void> endCheckin() async {
    if (informationForm() != null) {
      final result = await _patientInformationFormRepository.updateStatus(
          informationForm.value!.id,
          PatientInformationFormStatus.beingAttended);

      switch (result) {
        case Left():
          showError('Erro ao atualizar o status do formulário');

        case Right():
          endProcess.value = true;
      }
    } else {
      showError('Formulário não pode ser nulo');
    }
  }
}

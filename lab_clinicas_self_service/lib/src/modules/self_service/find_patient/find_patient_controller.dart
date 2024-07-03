import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  final PatientRepository _patientRepository;

  final _patientNotFound = Signal<bool?>(null);
  bool? get patientNotFound => _patientNotFound();

  final _patient = Signal<PatientModel?>(null);
  PatientModel? get patient => _patient();

  Future<void> findPatientByDocument(String document) async {
    final patientResult =
        await _patientRepository.findPatientByDocument(document);
    bool patientNotFound;
    PatientModel? patient;

    switch (patientResult) {
      case Right(value: PatientModel model?):
        patientNotFound = false;
        patient = model;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
      case Left():
        showError('Erro ao buscar paciente');
        return;
    }

    batch(() {
      _patient.set(patient,force: true);
      _patientNotFound.set(patientNotFound, force: true);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patient.value = null;
      _patientNotFound.set(true, force: true);
    });
  }
}

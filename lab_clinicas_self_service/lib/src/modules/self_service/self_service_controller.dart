import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  final _step = Signal(
    FormSteps.none,
  );

  var _model = const SelfServiceModel();
  SelfServiceModel get model => _model;

  FormSteps get step => _step();

  void startProcess() {
    _step.set(FormSteps.whoIAm, force: true);
  }

  void goPatient() {
    _step.set(FormSteps.patient, force: true);
  }

  void setWhoIAmDataStepAndNext(String name, String lastName) {
    _model = _model.copyWith(name: () => name, lastName: () => lastName);
    _step.set(FormSteps.findPatient, force: true);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.set(FormSteps.patient, force: true);
  }

  void restartProccess() {
    _step.set(FormSteps.restart, force: true);
    clearForm();
  }

  void updatePatientAndGoDocument(PatientModel? patient) {
    _model = _model.copyWith(
      patient: () => patient,
    );
    _step.set(FormSteps.documents, force: true);
  }

  void registerDocument(DocumentType type, String filePath) {
    final documents = _model.documents ?? {};
    if (type == DocumentType.healthInsuranceCard) {
      documents[type]?.clear();
    }

    final values = documents[type] ?? [];
    values.add(filePath);
    documents[type] = values;
    _model = _model.copyWith(documents: () => documents);
  }

  void clearDocuments() {
    _model = _model.copyWith(
      documents: () => {},
    );
  }
}

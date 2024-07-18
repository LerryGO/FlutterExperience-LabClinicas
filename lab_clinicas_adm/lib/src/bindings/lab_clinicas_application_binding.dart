import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/core/env.dart';
import 'package:lab_clinicas_adm/src/repositories/painel/painel_repository_impl.dart';
import 'package:lab_clinicas_adm/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import '../repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import '../repositories/attendant_desk_assignment/attendant_desk_assignment_repository_impl.dart';
import '../repositories/painel/painel_repository.dart';
import '../repositories/patient_information_form/patient_information_form_repository.dart';
import '../repositories/patient_information_form/patient_information_form_repository_impl.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(Env.backendBaseUrl),
        ),
        Bind.lazySingleton<PatientInformationFormRepository>(
          (i) => PatientInformationFormRepositoryImpl(
            restClient: i(),
          ),
        ),
        Bind.lazySingleton<AttendantDeskAssignmentRepository>(
          (i) => AttendantDeskAssignmentRepositoryImpl(
            restClient: i(),
          ),
        ),
        Bind.lazySingleton<PainelRepository>(
          (i) => PainelRepositoryImpl(
            restClient: i(),
          ),
        ),
        Bind.lazySingleton<CallNextPatientService>(
          (i) => CallNextPatientService(
            attendantDeskAssignmentRepository: i(),
            painelRepository: i(),
            patientInformationFormRepository: i(),
          ),
        ),
      ];
}

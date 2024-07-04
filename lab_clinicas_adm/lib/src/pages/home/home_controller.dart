import 'package:asyncstate/asyncstate.dart' as asybcstate;

import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import '../../repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';

class HomeController with MessageStateMixin {
  final AttendantDeskAssignmentRepository _attendantDeskAssignmentRepository;

  HomeController(
      {required AttendantDeskAssignmentRepository
          attendantDeskAssignmentRepository})
      : _attendantDeskAssignmentRepository = attendantDeskAssignmentRepository;

  Future<void> startService(int deskNumber) async {
    asybcstate.AsyncState.show();
    final result =
        await _attendantDeskAssignmentRepository.startService(deskNumber);

    switch (result) {
      case Left():
        asybcstate.AsyncState.hide();
        showError('Erro ao iniciar guighê');

      case Right():
        asybcstate.AsyncState.hide();
    }
  }
}

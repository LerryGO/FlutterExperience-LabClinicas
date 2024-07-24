import 'package:lab_clinicas_panel/src/models/painel_checkin_model.dart';
import 'package:lab_clinicas_panel/src/repositories/painel_checkin/painel_checkin_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PainelController {
  final PainelCheckinRepository _repository;
  final painelData = listSignal<PainelCheckinModel>([]);

  Connect? _painelConnect;

  PainelController({required PainelCheckinRepository repository})
      : _repository = repository;

  Function? _socketDispose;

  void listenerPainel() {
    // Abrindo conexão
    final (:channel, :dispose) = _repository.openChannelSocket();
    // Guardando o dispose
    _socketDispose = dispose;

    // Recebe o dados e transforma em signal a stream para atualizar a tela
    _painelConnect = connect(painelData);

    final painelStream = _repository.getTodayPanel(channel);

    _painelConnect!.from(painelStream);
  }

  void dispose() {
    _painelConnect?.dispose();
    if (_socketDispose != null) {
      _socketDispose!();
    }
  }
}

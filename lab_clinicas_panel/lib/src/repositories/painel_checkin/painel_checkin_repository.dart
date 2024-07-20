import 'package:lab_clinicas_panel/src/models/painel_checkin_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class PainelCheckinRepository {
  ({WebSocketChannel channel, Function dispose}) openChannelSocket();
  Stream<List<PainelCheckinModel>> getTodayPanel(WebSocketChannel channel);
}

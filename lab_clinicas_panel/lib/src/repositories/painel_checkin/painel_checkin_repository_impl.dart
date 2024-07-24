import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_panel/src/core/env.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../models/painel_checkin_model.dart';
import 'painel_checkin_repository.dart';

class PainelCheckinRepositoryImpl implements PainelCheckinRepository {
  final RestClient restClient;

  PainelCheckinRepositoryImpl({required this.restClient});
  @override
  Stream<List<PainelCheckinModel>> getTodayPanel(
      WebSocketChannel channel) async* {
    yield await requestData();
    yield* channel.stream.asyncMap((event) async => requestData());
  }

  @override
  ({WebSocketChannel channel, Function dispose}) openChannelSocket() {
    final channel = WebSocketChannel.connect(
        Uri.parse('${Env.wsBackendBaseUrl}?tables=painelCheckin'));

    return (
      channel: channel,
      dispose: () {
        channel.sink.close();
      }
    );
  }

  Future<List<PainelCheckinModel>> requestData() async {
    final dateFormat = DateFormat('y-MM-dd');
    final Response(:List data) = await restClient.auth.get(
      '/painelCheckin',
      queryParameters: {
        'time_called': dateFormat.format(DateTime.now()),
      },
    );
    return data.reversed
        .take(7)
        .map((e) => PainelCheckinModel.fromJson(e))
        .toList();
  }
}

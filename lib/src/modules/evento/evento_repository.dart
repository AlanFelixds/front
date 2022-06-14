import 'package:front_flutter/src/core/database/interface_web_client.dart';
import 'package:front_flutter/src/core/models/participante_model.dart';

class EventoRepository {
  final IWebClient _webService;
  EventoRepository(this._webService);

  Future<dynamic> criarEvento(Map body) async {
    final response = await _webService.post(url: '/evento', body: body);
    return response;
  }

  Future<dynamic> listEvent() async {
    final response = await _webService.get(url: '/evento');
    return response;
  }

  Future<dynamic> addParticipant(ParticipantModel participant) async {
    Map<String, dynamic> body = participant.toMap();
    final response = await _webService.post(url: '/event/participant', body: body);
    return response;
  }

  Future<dynamic> listParticipantsEvent({required String eventID}) async {
    final response = await _webService.post(url: '/event/participantList', body: {"event_id": eventID});
    return response;
  }
}

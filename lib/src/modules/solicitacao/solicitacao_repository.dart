import 'package:front_flutter/src/core/database/interface_web_client.dart';
import 'package:front_flutter/src/core/models/event_model.dart';
import 'package:front_flutter/src/core/models/participant_model.dart';

class SolicitacaoRepository {
  final IWebClient _webService;
  SolicitacaoRepository(this._webService);

  Future<dynamic> createEvent(EventModel event) async {
    Map<String, dynamic> body = event.toMap();
    final response = await _webService.post(url: '/event', body: body);
    return response;
  }

  Future<dynamic> listEvent() async {
    final response = await _webService.get(url: '/event');
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

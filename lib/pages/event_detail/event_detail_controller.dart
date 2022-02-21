import 'package:front_flutter/models/event_model.dart';
import 'package:front_flutter/pages/event_detail/event_detail_repository.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
  EventDetailRepository eventDetailRepository;
  EventDetailController(this.eventDetailRepository);

  RxList<EventModel> arguments = Get.arguments;
}

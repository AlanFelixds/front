import 'package:front_flutter/pages/event_detail/event_detail_controller.dart';
import 'package:front_flutter/pages/event_detail/event_detail_repository.dart';
import 'package:front_flutter/utils/web_service/web_service.dart';
import 'package:get/get.dart';

class EventDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailController>(() => EventDetailController(Get.find()));
    Get.lazyPut<EventDetailRepository>(() => EventDetailRepository(WebService()));
  }
}

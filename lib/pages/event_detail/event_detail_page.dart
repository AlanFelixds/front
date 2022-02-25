import 'package:flutter/material.dart';
import 'package:front_flutter/pages/event_detail/event_detail_controller.dart';
import 'package:front_flutter/utils/customs/custom_menu.dart';
import 'package:get/get.dart';

class EventDetailPage extends GetResponsiveView<EventDetailController> {
  EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: Container(
              color: Colors.blue,
              child: Column(
                children: const [CustomMenu()],
              ),
            ),
          ),
          Expanded(
            child: Container(
                color: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("Evento: Praça"),
                            Text("Data: 22-12-1992"),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 500,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text("nome: Alan"),
                                    Text("email: Alan@gmail.com"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text("nome: Alan"),
                                    Text("email: Alan@gmail.com"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text("nome: Alan"),
                                    Text("email: Alan@gmail.com"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mardodichat/models/chat_model.dart';
import 'package:mardodichat/utility/app_controller.dart';
import 'package:mardodichat/utility/app_service.dart';
import 'package:mardodichat/widgets/widget_form.dart';
import 'package:mardodichat/widgets/widget_icon_button.dart';
import 'package:mardodichat/widgets/widget_text.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController textEditingController = TextEditingController();

  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().findUserModel();
    AppService().readAllChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return appController.chatModels.isEmpty
            ? const SizedBox()
            : ListView.builder(
                itemCount: appController.chatModels.length,
                itemBuilder: (context, index) => BubbleSpecialThree(
                  text: '${appController.chatModels[index].mapSent["name"]}\n${appController.chatModels[index].message}',
                  color: Colors.grey.shade400,
                 
                ),
              );
      }),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 300,
            child: WidgetForm(
              textEditingController: textEditingController,
            ),
          ),
          WidgetIconButton(
            iconData: Icons.send,
            pressFunc: () async {
              if (textEditingController.text.isNotEmpty) {
                ChatModel chatModel = ChatModel(
                    mapSent: appController.userModels.last.toMap(),
                    message: textEditingController.text,
                    timestamp: Timestamp.fromDate(DateTime.now()));

                await FirebaseFirestore.instance
                    .collection('chat')
                    .doc()
                    .set(chatModel.toMap())
                    .then((value) {
                  textEditingController.text = '';
                });
              }
            },
          )
        ],
      ),
    );
  }
}

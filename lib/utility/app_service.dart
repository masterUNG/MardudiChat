import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mardodichat/models/chat_model.dart';
import 'package:mardodichat/models/user_model.dart';
import 'package:mardodichat/utility/app_controller.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> readAllChat() async {
    FirebaseFirestore.instance
        .collection('chat')
        .orderBy('timestamp')
        .snapshots()
        .listen((event) {
      if (event.docs.isNotEmpty) {
        if (appController.chatModels.isNotEmpty) {
          appController.chatModels.clear();
        }

        for (var element in event.docs) {
          ChatModel chatModel = ChatModel.fromMap(element.data());
          appController.chatModels.add(chatModel);
        }
      }
    });
  }

  Future<void> findUserModel() async {
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
      UserModel userModel = UserModel.fromMap(value.data()!);
      appController.userModels.add(userModel);
    });
  }
}

import 'package:get/get.dart';
import 'package:mardodichat/models/chat_model.dart';
import 'package:mardodichat/models/user_model.dart';

class AppController extends GetxController {
  
  List<ChatModel> chatModels = <ChatModel>[].obs;

  List<UserModel> userModels = <UserModel>[].obs;
}
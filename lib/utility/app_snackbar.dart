// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class AppSnackbar {
  final String title;
  final String message;
  AppSnackbar({
    required this.title,
    required this.message,
  });

  void normalSnackbar() {
    Get.snackbar(title, message);
  }
}

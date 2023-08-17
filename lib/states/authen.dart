import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mardodichat/states/chat.dart';
import 'package:mardodichat/states/create_new_account.dart';
import 'package:mardodichat/utility/app_snackbar.dart';
import 'package:mardodichat/widgets/widget_button.dart';
import 'package:mardodichat/widgets/widget_form.dart';
import 'package:mardodichat/widgets/widget_image.dart';
import 'package:mardodichat/widgets/widget_text.dart';
import 'package:mardodichat/widgets/widget_text_button.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print('You tap');
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      displayHead(),
                      const SizedBox(
                        height: 16,
                      ),
                      WidgetForm(
                        textEditingController: emailController,
                        hint: 'Email :',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      WidgetForm(
                        textEditingController: passwordController,
                        obsecu: true,
                        hint: 'Password :',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: 250,
                        child: WidgetButton(
                          label: 'Login',
                          pressFunc: () async {
                            if ((emailController.text.isEmpty) ||
                                (passwordController.text.isEmpty)) {
                              AppSnackbar(
                                      title: 'Have Space', message: 'Fill all')
                                  .errorSnackbar();
                            } else {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then((value) {
                                Get.offAll(Chat());
                                AppSnackbar(
                                        title: 'Login Success',
                                        message: 'Welcome')
                                    .normalSnackbar();
                              }).catchError((onError) {
                                AppSnackbar(
                                        title: onError.code,
                                        message: onError.message)
                                    .errorSnackbar();
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: WidgetTextButton(
        label: 'Create New Account',
        pressFunc: () {
          Get.to(CreateNewAccount());
        },
      ),
    );
  }

  Row displayHead() {
    return Row(
      children: [
        WidgetImage(
          size: 50,
        ),
        WidgetText(data: 'AppName'),
      ],
    );
  }
}

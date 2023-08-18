import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mardodichat/models/user_model.dart';
import 'package:mardodichat/utility/app_snackbar.dart';
import 'package:mardodichat/widgets/widget_button.dart';
import 'package:mardodichat/widgets/widget_form.dart';
import 'package:mardodichat/widgets/widget_text.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Create New Account'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      WidgetForm(
                        textEditingController: nameController,
                        labelWidget: const WidgetText(data: 'Display Name :'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      WidgetForm(
                        textEditingController: emailController,
                        labelWidget: const WidgetText(data: 'Email :'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      WidgetForm(
                        textEditingController: passwordController,
                        labelWidget: const WidgetText(data: 'Passowrd :'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      WidgetButton(
                        label: 'Create New Account',
                        pressFunc: () async {
                          if ((nameController.text.isEmpty) ||
                              (emailController.text.isEmpty) ||
                              (passwordController.text.isEmpty)) {
                            AppSnackbar(
                                    title: 'Have Space ?',
                                    message: 'Please Fill Every Blank')
                                .errorSnackbar();
                          } else {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) async {
                              String uid = value.user!.uid;

                              String? token =
                                  await FirebaseMessaging.instance.getToken();

                              UserModel model = UserModel(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                                  uid: uid,
                                  token: token ?? '');

                              await FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(uid)
                                  .set(model.toMap())
                                  .then((value) {
                                Get.back();
                                AppSnackbar(
                                        title: 'Create Account Success',
                                        message: 'Welcome')
                                    .normalSnackbar();
                              });
                            }).catchError((onError) {
                              AppSnackbar(
                                      title: onError.code,
                                      message: onError.message)
                                  .errorSnackbar();
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

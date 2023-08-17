import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mardodichat/states/create_new_account.dart';
import 'package:mardodichat/widgets/widget_button.dart';
import 'package:mardodichat/widgets/widget_form.dart';
import 'package:mardodichat/widgets/widget_image.dart';
import 'package:mardodichat/widgets/widget_text.dart';
import 'package:mardodichat/widgets/widget_text_button.dart';

class Authen extends StatelessWidget {
  const Authen({super.key});

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
                        hint: 'Email :',
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      WidgetForm(
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
                          pressFunc: () {},
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

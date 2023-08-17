import 'package:flutter/material.dart';
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
        title: WidgetText(data: 'Create New Account'),
      ),
      body: ListView(
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
                      labelWidget: WidgetText(data: 'Display Name :'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    WidgetForm(
                      textEditingController: emailController,
                      labelWidget: WidgetText(data: 'Email :'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    WidgetForm(
                      textEditingController: passwordController,
                      labelWidget: WidgetText(data: 'Passowrd :'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    WidgetButton(
                      label: 'Create New Account',
                      pressFunc: () {
                        if ((nameController.text.isEmpty) ||
                            (emailController.text.isEmpty) ||
                            (passwordController.text.isEmpty)) {
                          AppSnackbar(
                                  title: 'Have Space ?',
                                  message: 'Please Fill Every Blank')
                              .normalSnackbar();
                        } else {}
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

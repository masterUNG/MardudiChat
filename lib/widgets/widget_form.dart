// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.obsecu,
    this.labelWidget,
    this.textEditingController,
  }) : super(key: key);

  final String? hint;
  final bool? obsecu;
  final Widget? labelWidget;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: textEditingController,
      obscureText: obsecu ?? false,
      decoration: InputDecoration(
        label: labelWidget,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade300,
        border: InputBorder.none,
      ),
    );
  }
}

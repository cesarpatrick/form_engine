import 'package:flutter/material.dart';

class FormBuilderModal extends StatelessWidget {
  final dynamic form;
  const FormBuilderModal({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(child: form);
  }
}

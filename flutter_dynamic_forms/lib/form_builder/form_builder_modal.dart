import 'package:flutter/material.dart';

import 'input_form_modal.dart';

class FormBuilderModal extends StatelessWidget {
  final InputFormModal form;
  const FormBuilderModal({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(child: form);
  }
}

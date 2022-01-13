import 'package:flutter/material.dart';

class FormBuilderModal extends StatefulWidget {
  const FormBuilderModal({Key? key}) : super(key: key);

  @override
  _FormBuilderModalState createState() => _FormBuilderModalState();
}

class _FormBuilderModalState extends State<FormBuilderModal> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
          width: screenSize.width / 4,
          height: screenSize.height / 4,
          child: Container()),
    );
  }
}

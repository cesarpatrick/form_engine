import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/form_builder/form_builder_modal.dart';
import 'package:flutter_dynamic_forms/form_builder/input_form.dart';
import 'package:flutter_dynamic_forms/form_builder/radio_button_form.dart';
import 'package:flutter_dynamic_forms/form_builder/switch_input_form.dart';
import 'package:flutter_dynamic_forms/model/json_form.dart';
import 'package:flutter_dynamic_forms/model/constants.dart';
import 'package:flutter_dynamic_forms/service/form_builder_service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:json_to_form/json_schema.dart';

import 'checkbox_input_form.dart';

class MainFormBuilderScreen extends StatefulWidget {
  const MainFormBuilderScreen({Key? key}) : super(key: key);

  @override
  _MainFormBuilderScreenState createState() => _MainFormBuilderScreenState();
}

class _MainFormBuilderScreenState extends State<MainFormBuilderScreen> {
  static List<Field> fields = [];

  final FormBuilderService formService = FormBuilderService();

  ScrollController scrollController = ScrollController();

  JsonForm form = JsonForm(fields: fields);

  dynamic response;

  @override
  void initState() {
    super.initState();
  }

  void _addNewField(Field field, String type) {
    switch (type) {
      case INPUT:
        fields.add(formService.getInputField(field));
        break;
      case RADIO_BUTTON:
        fields.add(formService.getRadioButtonField(field));
        break;
      case SWITCH_INPUT:
        fields.add(formService.getSwitchField(field));
        break;
      case CHECKBOX_INPUT:
        fields.add(formService.getCheckboxField(field));
        break;
      default:
        fields.add(formService.getInputField(field));
    }

    setState(() {
      form = JsonForm(fields: fields);
      _setScrollToEnd();
    });
  }

  void _undoField() {
    fields.removeLast();

    setState(() {
      _setScrollToEnd();
    });
  }

  void _setScrollToEnd() {
    var scrollPosition = scrollController.position;

    scrollController.animateTo(
      scrollPosition.maxScrollExtent + 150,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const FormBuilderModal(form: InputFormModal());
                      }).then((value) => _addNewField(value, INPUT))
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.text_format, size: 15),
                      ),
                      TextSpan(
                          text: " Text Field",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const FormBuilderModal(
                            form: RadioButtonFormModal());
                      }).then((value) => _addNewField(value, RADIO_BUTTON))
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.radio_button_checked, size: 15),
                      ),
                      TextSpan(
                          text: " Radio Button",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const FormBuilderModal(form: InputFormModal());
                      }).then((value) => _addNewField(value, INPUT))
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.view_list, size: 15),
                      ),
                      TextSpan(
                          text: " Dropdown Select",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const FormBuilderModal(
                            form: CheckboxInputFormModal());
                      }).then((value) => _addNewField(value, CHECKBOX_INPUT))
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.check_box_outlined, size: 15),
                      ),
                      TextSpan(
                          text: " Check Box",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const FormBuilderModal(
                            form: SwitchInputFormModal());
                      }).then((value) => _addNewField(value, SWITCH_INPUT))
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.switch_left, size: 15),
                      ),
                      TextSpan(
                          text: " Switch",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => {_undoField()},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.undo_rounded, size: 15),
                      ),
                      TextSpan(
                          text: " Undo", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: screenSize.width / 1.5,
                  height: screenSize.height / 1.5,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 3)),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Center(
                        child: JsonSchema(
                      form: jsonEncode(form),
                      onChanged: (dynamic response) {
                        this.response = response;
                        print(response);
                        fields = JsonForm.fromJson(this.response).fields;
                        form = JsonForm(fields: fields);
                      },
                      actionSave: (data) {
                        print(data);
                      },
                      buttonSave: Container(
                        height: 40.0,
                        color: Colors.blueAccent,
                        child: const Center(
                          child: Text("Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => {_undoField()},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.save, size: 15),
                      ),
                      TextSpan(
                          text: " Save", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () => {_undoField()},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.cancel, size: 15),
                      ),
                      TextSpan(
                          text: " Cancel",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

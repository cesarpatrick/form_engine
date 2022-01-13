import 'package:flutter_dynamic_forms/model/json_form.dart';

class FormBuilderService {
  Field getInputField(String value, bool required, String label) {
    return Field(
        type: "Input",
        key: "textFieldKey",
        label: label,
        value: value,
        required: required);
  }
}

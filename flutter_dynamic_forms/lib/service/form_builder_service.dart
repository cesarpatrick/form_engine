import 'package:flutter_dynamic_forms/model/json_form.dart';

class FormBuilderService {
  Field getInputField(Field field) {
    return Field(
        type: "Input",
        key: "textFieldKey",
        label: field.label,
        value: field.value,
        required: field.required);
  }

  Field getRadioButtonField(Field field) {
    return Field(
        type: "RadioButton",
        key: "radiobutton1",
        label: field.label,
        value: field.value,
        required: field.required,
        items: field.items);
  }

  Field getSwitchField(Field field) {
    return Field(
        type: "Switch",
        key: "switchKey",
        label: field.label,
        value: false,
        required: field.required);
  }

  Field getCheckboxField(Field field) {
    return Field(
        type: "Checkbox",
        key: "checkboxKey",
        label: field.label,
        value: false,
        required: field.required);
  }
}

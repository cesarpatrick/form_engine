import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/model/json_form.dart';

class SwitchInputFormModal extends StatefulWidget {
  const SwitchInputFormModal({Key? key}) : super(key: key);

  @override
  _SwitchInputFormModalState createState() => _SwitchInputFormModalState();
}

class _SwitchInputFormModalState extends State<SwitchInputFormModal> {
  bool initialValueSwitch = false;
  TextEditingController labelController = TextEditingController();
  TextEditingController initialValueController = TextEditingController();

  bool _validate = false;

  @override
  void initState() {
    super.initState();
    initialValueSwitch = false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    labelController.dispose();
    initialValueController.dispose();
    super.dispose();
  }

  Field _next(String label, String initialValue, bool required) {
    return Field(
        key: "switch",
        type: "Switch",
        label: label,
        value: false,
        required: required);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 250,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Switch Input Field",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(children: <Widget>[
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Required',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Switch(
                        activeColor: Colors.green,
                        value: initialValueSwitch,
                        onChanged: (value) {
                          setState(() {
                            initialValueSwitch = value;
                          });
                        },
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: labelController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Label',
                          hintText: 'Enter the label',
                          errorText: _validate ? 'Label Can\'t Be Empty' : null,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              labelController.text.isEmpty
                                  ? _validate = true
                                  : _validate = false;

                              if (_validate == false) {
                                Navigator.of(context).pop(_next(
                                    labelController.text,
                                    initialValueController.text,
                                    initialValueSwitch));
                              }
                            })
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Next",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => {Navigator.of(context).pop()},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Cancel",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}

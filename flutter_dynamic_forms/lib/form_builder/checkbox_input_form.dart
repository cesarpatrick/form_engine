import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/model/json_form.dart';

class CheckboxInputFormModal extends StatefulWidget {
  const CheckboxInputFormModal({Key? key}) : super(key: key);

  @override
  _CheckboxInputFormModalState createState() => _CheckboxInputFormModalState();
}

class _CheckboxInputFormModalState extends State<CheckboxInputFormModal> {
  bool initialValueRequiredSwitch = false;
  bool initialValueOptionSwitch = false;

  List<Item> items = [];

  TextEditingController labelController = TextEditingController();
  TextEditingController initialValueController = TextEditingController();

  TextEditingController labelItemController = TextEditingController();
  TextEditingController valueItemController = TextEditingController();

  ScrollController scrollController = ScrollController();

  bool _validateLabel = false;
  bool _validateItemLabel = false;

  dynamic response;

  @override
  void initState() {
    super.initState();
    initialValueRequiredSwitch = false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    labelController.dispose();
    initialValueController.dispose();
    super.dispose();
  }

  Field _next(
      String label, String initialValue, bool required, List<Item> items) {
    return Field(
        key: "key",
        type: "RadioButton",
        label: label,
        value: initialValue,
        required: required,
        items: items);
  }

  void _undoField() {
    items.removeLast();
    setState(() {});
  }

  void _addOption(String label, dynamic value) {
    items.add(Item(label: label, value: value));
    labelItemController.text = "";
    valueItemController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
        width: screenSize.width / 3,
        height: screenSize.height / 1.5,
        child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Checkbox Input Field",
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
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
                            value: initialValueRequiredSwitch,
                            onChanged: (value) {
                              setState(() {
                                initialValueRequiredSwitch = value;
                              });
                            },
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: labelController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Label',
                              hintText: 'Enter the label',
                              errorText: _validateLabel
                                  ? 'Label Can\'t Be Empty'
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Options",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: labelItemController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Option Label',
                              hintText: 'Enter the option label',
                              errorText: _validateItemLabel
                                  ? 'Option Label Can\'t Be Empty'
                                  : null,
                            ),
                          ),
                        ),
                        Row(children: <Widget>[
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Selected',
                            style: TextStyle(fontSize: 17.0),
                          ),
                          Switch(
                            activeColor: Colors.green,
                            value: initialValueOptionSwitch,
                            onChanged: (value) {
                              setState(() {
                                initialValueOptionSwitch = value;
                              });
                            },
                          ),
                        ]),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    if (labelItemController.text.isEmpty) {
                                      _validateItemLabel = true;
                                    } else {
                                      _validateItemLabel = false;
                                    }

                                    if (_validateItemLabel == false) {
                                      _addOption(labelItemController.text,
                                          initialValueOptionSwitch.toString());
                                    }
                                  })
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Add Option",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () => {_undoField()},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                ),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child:
                                            Icon(Icons.undo_rounded, size: 15),
                                      ),
                                      TextSpan(
                                          text: " Undo",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                              )
                            ]),
                        const SizedBox(height: 20),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              DataTable(
                                  border: TableBorder.all(color: Colors.green),
                                  columns: const <DataColumn>[
                                    DataColumn(
                                        label: Text("Options",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text("Selected",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ],
                                  rows: items
                                      .map(
                                        (item) => DataRow(
                                          cells: [
                                            DataCell(Text(item.label)),
                                            DataCell(Text(item.value))
                                          ],
                                        ),
                                      )
                                      .toList())
                            ]),
                        const SizedBox(height: 50),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () => {
                                setState(() {
                                  labelController.text.isEmpty
                                      ? _validateLabel = true
                                      : _validateLabel = false;

                                  if (_validateLabel == false) {
                                    Navigator.of(context).pop(_next(
                                        labelController.text,
                                        initialValueController.text,
                                        initialValueRequiredSwitch,
                                        items));
                                  }
                                })
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
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
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
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
            )));
  }
}

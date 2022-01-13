import 'package:flutter/material.dart';

class InputFormModal extends StatefulWidget {
  const InputFormModal({Key? key}) : super(key: key);

  @override
  _InputFormModalState createState() => _InputFormModalState();
}

class _InputFormModalState extends State<InputFormModal> {
  bool initialValue = false;

  @override
  void initState() {
    super.initState();
    initialValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 350,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Parameters",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Label',
                          hintText: 'Enter the label',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Initial Value',
                          hintText: 'Enter the initial value',
                        ),
                      ),
                    ),
                    Row(children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Required',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Switch(
                        activeColor: Colors.red,
                        value: initialValue,
                        onChanged: (value) {
                          setState(() {
                            initialValue = value;
                          });
                        },
                      )
                    ]),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => {Navigator.of(context).pop()},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Ok",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
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

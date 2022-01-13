import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List _isHovering = [false, false, false];

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Image.asset("assets/images/logo.png"),
              const Chip(
                padding: EdgeInsets.all(0),
                backgroundColor: Colors.white,
                label: Text('Rubbish Direct Form Engine',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Form Templates',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.exit_to_app,
                            size: 15, color: Colors.green),
                      ),
                      TextSpan(
                          text: " Sign Out",
                          style: TextStyle(color: Colors.green))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

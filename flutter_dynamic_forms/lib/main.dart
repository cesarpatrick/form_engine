import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/form_builder/main_form_builder_screen.dart';
import 'package:flutter_dynamic_forms/main/components/header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 1000), child: const Header()),
      body: const MainFormBuilderScreen(),
    );
  }
}


// import 'dart:convert';

// import 'package:flutter/material.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:json_to_form/json_schema.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rubbish Direct Form Engine',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Rubbish Direct Form Engine'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String formString = json.encode({
//     'fields': [
//       {
//         'key': 'inputKey',
//         'type': 'Input',
//         'label': 'Hi Group',
//         'placeholder': "Hi Group flutter",
//         'required': true
//       },
//       {
//         'key': 'inputKey',
//         'type': 'Input',
//         'label': 'Initial Value',
//         'value': 'Hello',
//         'required': true
//       },
//       {
//         'key': 'radiobutton1',
//         'type': 'RadioButton',
//         'label': 'Radio Button tests',
//         'value': 2,
//         'items': [
//           {
//             'label': "product 1",
//             'value': 1,
//           },
//           {
//             'label': "product 2",
//             'value': 2,
//           },
//           {
//             'label': "product 3",
//             'value': 3,
//           }
//         ]
//       },
//       {
//         'key': 'select1',
//         'type': 'Select',
//         'label': 'Select test',
//         'value': 'product 1',
//         'items': [
//           {
//             'label': "product 1",
//             'value': "product 1",
//           },
//           {
//             'label': "product 2",
//             'value': "product 2",
//           },
//           {
//             'label': "product 3",
//             'value': "product 3",
//           }
//         ]
//       }
//     ]
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SizedBox(
//           child: Center(
//         child: JsonSchema(
//           form: formString,
//           onChanged: (dynamic response) {},
//           actionSave: (data) {
//             print(data);
//           },
//           buttonSave: Container(
//             height: 40.0,
//             color: Colors.blueAccent,
//             child: const Center(
//               child: Text("Submit",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myblog/home.dart';
import 'package:flutter/material.dart';
import 'package:myblog/web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hamidi's Blog",
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();
    bool kisweb;
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        kisweb = false;
      } else {
        kisweb = true;
      }
    } catch (e) {
      kisweb = true;
    }
    return !kisweb
        ? homeScreen()
        : Scaffold(
            body: Center(
              child: SizedBox(
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: passController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          if (passController.text == dotenv.env['websitePass'])
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => WebPage(),
                              ),
                            );
                        },
                        child: Text('ENTER'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

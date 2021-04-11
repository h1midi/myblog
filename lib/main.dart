import 'dart:io';
import 'package:url_launcher/link.dart';
import 'package:flutter/material.dart';

void main() {
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
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Link(
            uri: Uri.parse("https://github.com/hammiddi"),
            target: LinkTarget.blank,
            builder: (context,folowLink){
            return ElevatedButton(onPressed: folowLink, child: Text("GitHub"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0.0),
              ),
              );
            }
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Link(
            uri: Uri.parse("http://linkedin.com/in/hammiddi"),
            target: LinkTarget.blank,
            builder: (context,folowLink){
            return ElevatedButton(onPressed: folowLink,
             child: Text("LinkedIn"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0.0),
              ),
              );
            }
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Link(
            uri: Uri.parse("http://twitter.com/hammiddi"),
            target: LinkTarget.blank,
            builder: (context,folowLink){
            return ElevatedButton(
              onPressed: folowLink, 
              child: Text("Twitter"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0.0),
              ),
              );
            }
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Link(
            uri: Uri.parse("mailto:mohammed.hamidi@univ-tlemcen.dz"),
            target: LinkTarget.blank,
            builder: (context,folowLink){
            return ElevatedButton(
              onPressed: folowLink, 
              child: Text("Mail"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all<double>(0.0),
              ),
              );
            }
          ),
        ),
        ],
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hamidi's"),
            Text(
              "Blog",
              style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.w900,
                    ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.all(16),
          crossAxisCount: 4,
          children: [ 
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              margin: EdgeInsets.all(16),
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            ]
          ),
        ),
        );
  }
}

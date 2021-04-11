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
      home: MyHomePage(title: 'Welcome to my Blog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          children: [ 
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            Card(
              child: Center(child: Text('Hello World')),
              color: Colors.amber,
              ),
            ]
          ),
        ),
        );
  }
}

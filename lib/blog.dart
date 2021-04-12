import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';



class BlogScreen extends StatelessWidget {
  final String body;
  BlogScreen(this.body);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder(
            future: rootBundle.loadString(body),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(data: snapshot.data.toString());
              }

              else return Center(
                child: CircularProgressIndicator(),
              );
            }),
    );
  }
}
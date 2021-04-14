import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BlogScreen extends StatelessWidget {
  final String body,title;
  BlogScreen(this.body,this.title);
  @override
  Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(width*0.2, 20, width*0.2, 20),
        child: SingleChildScrollView(
          child: Html(data: body),
        ),
      ),
    );
  }
}

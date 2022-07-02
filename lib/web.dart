import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WebPage extends StatelessWidget {
  const WebPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController imgController = TextEditingController();
    TextEditingController bodyController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          width: 1000,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "TITLE"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: descController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "DESCRIPTION"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: imgController,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(labelText: "IMAGE URL"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 350,
                  child: TextField(
                    controller: bodyController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(labelText: "BODY"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance //
                        .collection('blog')
                        .doc()
                        .set(
                      {
                        'title': titleController.text,
                        'desc': descController.text,
                        'img': imgController.text,
                        'body': bodyController.text
                      },
                    );
                  },
                  child: Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

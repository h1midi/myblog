import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'blog.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
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
                builder: (context, folowLink) {
                  return ElevatedButton(
                    onPressed: folowLink,
                    child: Text("GitHub"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0.0),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Link(
                uri: Uri.parse("http://linkedin.com/in/hammiddi"),
                target: LinkTarget.blank,
                builder: (context, folowLink) {
                  return ElevatedButton(
                    onPressed: folowLink,
                    child: Text("LinkedIn"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0.0),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Link(
                uri: Uri.parse("http://twitter.com/hammiddi"),
                target: LinkTarget.blank,
                builder: (context, folowLink) {
                  return ElevatedButton(
                    onPressed: folowLink,
                    child: Text("Twitter"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0.0),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Link(
                uri: Uri.parse("mailto:mohammed.hamidi@univ-tlemcen.dz"),
                target: LinkTarget.blank,
                builder: (context, folowLink) {
                  return ElevatedButton(
                    onPressed: folowLink,
                    child: Text("Mail"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0.0),
                    ),
                  );
                }),
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
      body: _content(context),
    );
  }
}

Widget _content(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('blog').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return _error(context, 'no connection1');
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return _error(context, snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return _error(context, 'no connection2');
            }
            return _drawScreen(context, snapshot.data);
        }
      },
    ),
  );
}

Widget _drawScreen(BuildContext context, QuerySnapshot data) {
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 3 / 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      shrinkWrap: true,
      itemCount: data.docs.length,
      itemBuilder: (BuildContext context, int position) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        BlogScreen(data.docs[position]['body'],data.docs[position]['title'])));
          },
          child: Card(
            margin: EdgeInsets.all(16),
            child: Stack(
              children: [
                data.docs[position]['img'] != ''
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          imageUrl: data.docs[position]['img'],
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          color: Colors.amber,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 300.0,
                            maxWidth: 500.0,
                            minHeight: 50.0,
                            maxHeight: 60.0,
                          ),
                          child: AutoSizeText(
                            data.docs[position]['title'],
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 0.6,
                                    offset: Offset(1, 1)),
                              ],
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 55,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 300.0,
                            maxWidth: 500.0,
                            minHeight: 30.0,
                            maxHeight: 45.0,
                          ),
                          child: AutoSizeText(
                            data.docs[position]['desc'],
                            minFontSize: 10,
                            maxLines: 3,
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 0.3,
                                    offset: Offset(1, 1)),
                              ],
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget _error(BuildContext context, String mssg) {
  return Center(
    child: Text(
      mssg,
      style: TextStyle(color: Colors.amber),
    ),
  );
}

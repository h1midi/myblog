import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('blog').snapshots(),
    // ignore: missing_return
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
  );
}

Widget _drawScreen(BuildContext context, QuerySnapshot data) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: data.docs.length,
    itemBuilder: (BuildContext context, int position) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black26,
          child: _buildListItem(
            Colors.amber, //
            data.docs[position]['title'], //
            data.docs[position]['desc'], //
            data.docs[position]['img'], //
            () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BlogScreen(
                          data.docs[position]['body'],
                          data.docs[position]['title'])));
            },
          ),
        ),
      );
    },
  );
}

Widget _error(BuildContext context, String mssg) {
  return Center(
    child: Text(
      mssg,
      style: TextStyle(color: Colors.amber),
    ),
  );
}

Widget _buildListItem(
    Color color, String title, String desc, String image, Function fn) {
  return InkWell(
    onTap: fn,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: image,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Container(),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                const SizedBox(height: 10.0),
                Text(
                  desc,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogScreen extends StatelessWidget {
  final String body, title;
  BlogScreen(this.body, this.title);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        title: Text(
          title,
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Container(
              color: Colors.black26,
              child: Html(
                data: body,
                onLinkTap: (url, _, __, ___) async {
                  await launchUrl(Uri.parse(url));
                },
                style: {
                  'p': Style(
                    fontSize: FontSize(16),
                  ),
                  'h1': Style(
                    fontSize: FontSize(22),
                  ),
                  'h2': Style(
                    fontSize: FontSize(21),
                  ),
                  'h3': Style(
                    fontSize: FontSize(20),
                  ),
                  'a': Style(
                    fontSize: FontSize(18),
                  ),
                  'code': Style(
                    fontSize: FontSize(12),
                    color: Colors.amber[200],
                  ),
                },
              ),
            ),
            padding: width >= 1000
                ? EdgeInsets.fromLTRB(width * 0.2, 20, width * 0.2, 20)
                : EdgeInsets.all(20)),
      ),
    );
  }
}

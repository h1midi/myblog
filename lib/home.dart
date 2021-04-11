import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

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
      body:_content(context),

    );
  }
}


Widget _content(BuildContext context){
  return Padding(
    padding: EdgeInsets.all(16),
    child: StreamBuilder(
     stream:  FirebaseFirestore.instance.collection('blog').snapshots(),
     builder: (BuildContext context, AsyncSnapshot snapshot){
       switch (snapshot.connectionState ) {
         
         case ConnectionState.none:
           return _error(context, 'no connection1');
           break;
         case ConnectionState.waiting:
           return Center(child: CircularProgressIndicator(),);
           break;
         case ConnectionState.active:
         case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return _error(context, snapshot.error.toString());
            }
            if (! snapshot.hasData) {
              return _error(context, 'no connection2');
            }
           return _drawScreen(context, snapshot.data);
           break;
       }
     },
      ),
  );
}

Widget _drawScreen(BuildContext context,QuerySnapshot data) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
    itemCount: data.docs.length,
    itemBuilder: (BuildContext context, int position){
      return Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.docs[position]['title'],
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 0.6,
                            offset: Offset(1,1)
                        ),],
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                     ),
                     SizedBox(height: 12,),
                    Text(
                      data.docs[position]['desc'],
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            blurRadius: 0.6,
                            offset: Offset(1,1)
                        ),],
                        fontSize: 14,
                        color: Colors.grey.shade300
                      ),
                      textAlign: TextAlign.center,
                     ),
                  ],
                ),
              ),
              color: Colors.amber,
              );
  });
}

Widget _error(BuildContext context, String mssg){
  return Center(
     child: Text(mssg,style: TextStyle(color: Colors.amber),),
  );
}
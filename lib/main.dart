import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JobGuru App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
        appBar: AppBar(title: Text('Job Guru'), backgroundColor: Colors.green,
          actions: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.home, color: Colors.white,),
                  onPressed: (){
                    setState(() {
                      _controller.loadUrl('https://www.jobguru.co.in');
                    });
                  },
                ),
                FlatButton(
                  child: Icon(Icons.share, color: Colors.white,),
                  onPressed: (){
                    Share.share('Download JobGuru on PlayStore : https://play.google.com/store/apps/details?id=com.digitalmarket.jobguru');
                  },
                ),
              ],
            ),


          ],),
        body: WebView(
          initialUrl: 'https://www.jobguru.co.in',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ));
  }
}

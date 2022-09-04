import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTrack extends StatefulWidget {
  const WebViewTrack({Key? key}) : super(key: key);

  @override
  State<WebViewTrack> createState() => _WebViewTrackState();
}

class _WebViewTrackState extends State<WebViewTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Your Ambulance"),
      ),
      body: WebView(
        initialUrl: 'https://sai-kumar-kanuri.github.io/Google-Map--Clone-/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {},
      ),
    );
  }
}

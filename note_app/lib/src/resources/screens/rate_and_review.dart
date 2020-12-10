import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RateandReview extends StatefulWidget {
  const RateandReview({
    Key key,
  }) : super(key: key);
  @override
  _RateandReviewPage createState() => _RateandReviewPage();
}

class _RateandReviewPage extends State<RateandReview> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  //Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá'),
        elevation: 0.0,
        backgroundColor: Colors.blue[500],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(
        initialUrl: 'https://play.google.com/store',
        // javascriptMode: Java,
      ),
    );
  }
}

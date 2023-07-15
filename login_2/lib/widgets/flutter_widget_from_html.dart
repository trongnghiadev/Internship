import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class IWebView {
  Widget build({
    required BuildContext context,
    required Widget webView,
    required WebViewController controller,
  });
}

class GoogleMapsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final src = '''
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.4602949547116!2d106.66478987475163!3d10.776014689372714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f56076e63b9%3A0xbb46bf41e57b0bc3!2zQnVmZmV0IEzhuql1IE7GsOG7m25nIDg4IENOMg!5e0!3m2!1svi!2s!4v1689411810939!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    ''';

    return HtmlWidget(
      src,
      webView: true,
    );
  }
}

class _IframeWidgetFactory extends WidgetFactory {
  final BuildContext context;

  _IframeWidgetFactory(this.context);

  @override
  IWebView createWebView() => MyWebView(context: context);
}

class MyWebView extends IWebView {
  final BuildContext context;

  MyWebView({required this.context});

  @override
  Widget build({
    required BuildContext context,
    required Widget webView,
    required WebViewController controller,
  }) {
    return SizedBox(
      height: 400, // Set the desired height
      child: WebView(
        initialUrl: '',
        onWebViewCreated: (WebViewController webViewController) {
          webViewController.loadUrl(
              'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29800.476276977604!2d-122.41941505068734!3d37.77492959999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80858060d4924b23%3A0x7207f6810ecf9f08!2sSan%20Francisco%2C%20CA%2C%20USA!5e0!3m2!1sen!2sin!4v1566875456499!5m2!1sen!2sin');
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:login_2/config/const.dart';

class LazyLoadIframeHtmlWidget extends StatefulWidget {
  final String iframeHtml;

  const LazyLoadIframeHtmlWidget({Key? key, required this.iframeHtml})
      : super(key: key);

  @override
  _LazyLoadIframeHtmlWidgetState createState() =>
      _LazyLoadIframeHtmlWidgetState();
}

class _LazyLoadIframeHtmlWidgetState extends State<LazyLoadIframeHtmlWidget> {
  bool _isVisible = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkVisibility);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _checkVisibility() {
    RenderObject? renderObject = context.findRenderObject();
    double screenHeight = MediaQuery.of(context).size.height;
    double widgetTopPosition =
        renderObject?.getTransformTo(null).getTranslation().y ?? 0;
    double visibilityThreshold = screenHeight - 100;

    setState(() {
      _isVisible = widgetTopPosition < visibilityThreshold;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        backgroundColor: AppColors.dColorMain,
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Visibility(
            visible: _isVisible,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 500,
                height: 400,
                child: HtmlWidget(
                  widget.iframeHtml,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

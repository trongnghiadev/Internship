import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingPlaceHolder extends StatefulWidget {
  const LoadingPlaceHolder(this.visibility, {super.key});

  final bool visibility;

  @override
  State<LoadingPlaceHolder> createState() => _LoadingPlaceHolderState();
}

class _LoadingPlaceHolderState extends State<LoadingPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return widget.visibility
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.3)),
            child: const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                  strokeWidth: 3,
                ),
              ),
            ),
          )
        : const SizedBox(
            width: 0,
          );
  }
}

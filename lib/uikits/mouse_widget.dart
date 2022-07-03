// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle(BuildContext context) {
  return const TextStyle(color: Colors.white, fontSize: 12);
}

typedef MouseWidgetListener = Widget Function(bool isOnHover, bool isOnClick);

class MouseWidget extends StatefulWidget {
  final MouseWidgetListener widget;
  final Function(PointerHoverEvent)? onHover;
  final Function()? onClick;
  final String? showUrl;
  final bool useBaseHost;

  const MouseWidget({
    Key? key,
    required this.widget,
    this.onHover,
    this.onClick,
    this.showUrl,
    this.useBaseHost = true,
  }) : super(key: key);

  @override
  State<MouseWidget> createState() => _MouseWidgetState();
}

class _MouseWidgetState extends State<MouseWidget> {
  bool _isOnHover = false;
  bool _isOnClick = false;

  Size boundingTextSize(String text, TextStyle style,
      {int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  SnackBar _buildSnackBar(BuildContext context) {
    String text = '';
    if (widget.showUrl != null) {
      String hostText = window.location.protocol + '//' + window.location.host;
      if (widget.useBaseHost) {
        text = hostText + (widget.showUrl ?? '');
      } else {
        text = (widget.showUrl ?? '');
      }
    }
    Size textSize =
        boundingTextSize(text, _textStyle(context), maxLines: 1, maxWidth: 200);
    double rightPadding = MediaQuery.of(context).size.width - textSize.width;
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(0),
      padding: EdgeInsets.only(right: rightPadding),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        // constraints: const BoxConstraints(maxWidth: 150, minWidth: 0),
        width: textSize.width,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Text(
          text,
          style: _textStyle(context),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (PointerEnterEvent event) {
        _isOnHover = true;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(context));
      },
      onExit: (PointerExitEvent event) {
        _isOnHover = false;
        setState(() {});
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      },
      onHover: widget.onHover,
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          _isOnClick = true;
          setState(() {});
        },
        onTapUp: (TapUpDetails details) {
          _isOnClick = false;
          setState(() {});
        },
        onTap: widget.onClick,
        child: widget.widget(_isOnHover, _isOnClick),
      ),
    );
  }
}

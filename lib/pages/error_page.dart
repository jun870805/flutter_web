import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  static const String route = '/errorPage';
  const ErrorPage({Key? key, this.routeString}) : super(key: key);

  final String? routeString;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('${widget.routeString} 404 Error Page'),
        ),
      ),
    );
  }
}

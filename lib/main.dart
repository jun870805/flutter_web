import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './includes.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstRun = true;

  Future<void> _loadImage(BuildContext context) async {
    await PreCacheImage().loadAll(context);
    isFirstRun = false;
    setState(() {});
  }

  @override
  void initState() {
    _loadImage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isFirstRun
        ? MaterialApp(
            title: 'Loading',
            debugShowCheckedModeBanner: false,
            builder: (context, child) => SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          )
        : const MaterialApp(
            initialRoute: NavigationPage.route,
            onGenerateRoute: RouteConfiguration.onGenerateRoute,
            title: 'Web',
            debugShowCheckedModeBanner: false,
            // home: const VerifyUser(),
          );
  }
}

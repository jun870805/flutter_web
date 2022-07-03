import 'package:flutter/material.dart';
import '../includes.dart';

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;
  final Widget Function(BuildContext, String?) builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    // Path(
    //   r'^/article/([\w-]+)$',
    //   (context, match) => Article.getArticlePage(match),
    // ),
    Path(
      r'^' + NavigationPage.route,
      (context, match) => const NavigationPage(),
    ),
    Path(
      r'^' + PrivacyPage.route,
      (context, match) => const PrivacyPage(),
    ),
    Path(
      r'^' + TermsPage.route,
      (context, match) => const TermsPage(),
    ),
    Path(
      r'^' + HomePage.route,
      (context, match) => const HomePage(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name ?? '')) {
        final firstMatch = regExpPattern.firstMatch(settings.name ?? '');
        final match =
            (firstMatch?.groupCount == 1) ? firstMatch!.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => const NavigationPage(),
      );
    }

    return MaterialPageRoute(
      builder: (context) => ErrorPage(
        routeString: settings.name,
      ),
    );
  }
}

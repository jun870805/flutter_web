import 'package:flutter/material.dart';

const double _kDesktopMinScreen = 1440;
const double _kTabletMinScreen = 768;
const double _kMobileMinScreen = 375;

enum ResponsiveType {
  desktop,
  tablet,
  mobile,
}

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget? tabletScreen;
  final Widget? mobileScreen;

  const ResponsiveWidget({
    Key? key,
    required this.desktopScreen,
    this.tabletScreen,
    this.mobileScreen,
  }) : super(key: key);

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < _kTabletMinScreen;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > _kDesktopMinScreen;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= _kTabletMinScreen &&
        MediaQuery.of(context).size.width <= _kDesktopMinScreen;
  }

  static ResponsiveType getResponsiveType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > _kDesktopMinScreen) {
      return ResponsiveType.desktop;
    } else if (width <= _kDesktopMinScreen && width >= _kTabletMinScreen) {
      return ResponsiveType.tablet;
    } else {
      return ResponsiveType.mobile;
    }
  }

  static double getResponsiveWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > _kDesktopMinScreen) {
      return _kDesktopMinScreen;
    } else if (width <= _kDesktopMinScreen && width >= _kTabletMinScreen) {
      return _kTabletMinScreen;
    } else {
      return _kMobileMinScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > _kDesktopMinScreen) {
          return desktopScreen;
        } else if (constraints.maxWidth <= _kDesktopMinScreen &&
            constraints.maxWidth >= _kTabletMinScreen) {
          return tabletScreen ?? desktopScreen;
        } else {
          return mobileScreen ?? desktopScreen;
        }
      },
    );
  }
}

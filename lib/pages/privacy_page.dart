import 'package:flutter/material.dart';
import '../includes.dart';

class PrivacyPage extends StatefulWidget {
  static const String route = '/privacy';
  const PrivacyPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: ResponsiveWidget.getResponsiveWidth(context),
            height: (ResponsiveWidget.isMobileScreen(context) ? 60 : 84),
            decoration: const BoxDecoration(
              color: Color(0xFFB088ED),
            ),
            child: MouseWidget(
              widget: (bool isOnHover, bool isOnClick) {
                return Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fitHeight,
                );
              },
              onClick: () async {
                Navigator.of(context).popAndPushNamed(NavigationPage.route);
              },
              showUrl: NavigationPage.route,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '© 2022 Peter Fan  |',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: Color(0xFF8F97A3),
                  ),
                ),
                const SizedBox(width: 8),
                MouseWidget(
                  widget: (bool isOnHover, bool isOnClick) {
                    return Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: const Color(0xFF8F97A3),
                        decoration: isOnHover
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    );
                  },
                  onClick: () {
                    Navigator.of(context).popAndPushNamed(TermsPage.route);
                  },
                  showUrl: TermsPage.route,
                ),
                const SizedBox(width: 4),
                MouseWidget(
                  widget: (bool isOnHover, bool isOnClick) {
                    return Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: const Color(0xFF8F97A3),
                        decoration: isOnHover
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

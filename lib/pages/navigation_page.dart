import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../includes.dart';

class NavigationPage extends StatefulWidget {
  static const String route = '/navigation';
  const NavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildContinueButton(BuildContext context) {
    return Positioned(
      top: 425,
      child: MouseWidget(
        widget: (bool isOnHover, bool isOnClick) {
          return Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.4),
              boxShadow: isOnHover
                  ? [
                      BoxShadow(
                        color: const Color(0XFF000000).withOpacity(0.15),
                        offset: const Offset(0.0, 4.0), //陰影y軸偏移量
                        blurRadius: 4, //陰影模糊程度
                        spreadRadius: 0, //陰影擴散程度
                      ),
                    ]
                  : [],
            ),
            child: const Text(
              'Continue ...',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 32.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                height: 1.2,
                color: Color(0xFFB087F2),
              ),
            ),
          );
        },
        onClick: () {
          Navigator.of(context).pushNamed(HomePage.route);
        },
        showUrl: HomePage.route,
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/navigation_background.png'),
          ),
        ),
        Positioned(
          top: 80,
          width: 500,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        const Positioned(
          top: 240,
          child: Text(
            'Just Do It',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 48.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Color(0xFFCFB8F5),
            ),
          ),
        ),
        Positioned(
          top: 400,
          right: 68,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Keep on going never give up.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xFF9F7FD6),
                ),
              ),
              Text(
                'Take control of your own desting.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xFF9F7FD6),
                ),
              ),
            ],
          ),
        ),
        _buildContinueButton(context),
        Positioned(
          bottom: 36,
          child: Row(
            children: [
              const Text(
                '© 2022 Peter Fan  |',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFFFFFFFF),
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
                      color: const Color(0xFFFFFFFF),
                      decoration: isOnHover
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  );
                },
                onClick: () {
                  Navigator.of(context).pushNamed(TermsPage.route);
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
                      color: const Color(0xFFFFFFFF),
                      decoration: isOnHover
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  );
                },
                onClick: () {
                  Navigator.of(context).pushNamed(PrivacyPage.route);
                },
                showUrl: PrivacyPage.route,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          right: 25,
          width: 44,
          height: 44,
          child: MouseWidget(
            widget: (bool isOnHover, bool isOnClick) {
              return Image.asset(
                'assets/images/social_discord.png',
                fit: BoxFit.fitHeight,
              );
            },
            onClick: () async {
              await launchUrl(Uri.parse('https://discord.gg/'));
            },
            showUrl: 'https://discord.gg/',
            useBaseHost: false,
          ),
        ),
        Positioned(
          bottom: 25,
          right: 81,
          width: 44,
          height: 44,
          child: MouseWidget(
            widget: (bool isOnHover, bool isOnClick) {
              return Image.asset(
                'assets/images/social_twitter.png',
                fit: BoxFit.fitHeight,
              );
            },
            onClick: () async {
              await launchUrl(Uri.parse('https://twitter.com/'));
            },
            showUrl: 'https://twitter.com/',
            useBaseHost: false,
          ),
        ),
      ],
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/navigation_background.png'),
          ),
        ),
        Positioned(
          top: 80,
          width: 500,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        const Positioned(
          top: 230,
          right: 124,
          left: 124,
          child: Text(
            'Just Do It',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 48.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Color(0xFFCFB8F5),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 400,
          right: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Keep on going never give up.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xFF9F7FD6),
                ),
              ),
              Text(
                'Take control of your own desting.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xFF9F7FD6),
                ),
              ),
            ],
          ),
        ),
        _buildContinueButton(context),
        Positioned(
          bottom: 36,
          child: Row(
            children: [
              const Text(
                '© 2022 Peter Fan  |',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const SizedBox(width: 8),
              MouseWidget(
                widget: (bool isOnHover, bool isOnClick) {
                  return Text(
                    'Terms & Condition',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: const Color(0xFFFFFFFF),
                      decoration: isOnHover
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  );
                },
                onClick: () {
                  Navigator.of(context).pushNamed(TermsPage.route);
                },
                showUrl: TermsPage.route,
              ),
              const SizedBox(width: 4),
              MouseWidget(
                widget: (bool isOnHover, bool isOnClick) {
                  return Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: const Color(0xFFFFFFFF),
                      decoration: isOnHover
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  );
                },
                onClick: () {
                  Navigator.of(context).pushNamed(PrivacyPage.route);
                },
                showUrl: PrivacyPage.route,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          right: 25,
          width: 44,
          height: 44,
          child: MouseWidget(
            widget: (bool isOnHover, bool isOnClick) {
              return Image.asset(
                'assets/images/social_discord.png',
                fit: BoxFit.fitHeight,
              );
            },
            onClick: () async {
              await launchUrl(Uri.parse('https://discord.gg/'));
            },
            showUrl: 'https://discord.gg/',
            useBaseHost: false,
          ),
        ),
        Positioned(
          bottom: 25,
          right: 81,
          width: 44,
          height: 44,
          child: MouseWidget(
            widget: (bool isOnHover, bool isOnClick) {
              return Image.asset(
                'assets/images/social_twitter.png',
                fit: BoxFit.fitHeight,
              );
            },
            onClick: () async {
              await launchUrl(Uri.parse('https://twitter.com/'));
            },
            showUrl: 'https://twitter.com/',
            useBaseHost: false,
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/navigation_background.png'),
          ),
        ),
        Positioned(
          top: 80,
          width: 500,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        const Positioned(
          top: 208,
          right: 24,
          left: 24,
          child: Text(
            'Just Do It',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Color(0xFF7258A0),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 334,
          right: 24,
          left: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Keep on going never give up.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xFFCFB8F5),
                ),
              ),
              Text(
                'Take control of your own desting.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xFFCFB8F5),
                ),
              ),
            ],
          ),
        ),
        _buildContinueButton(context),
        Positioned(
          bottom: 28,
          left: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '© 2022 Peter Fan  |',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Row(
                children: [
                  MouseWidget(
                    widget: (bool isOnHover, bool isOnClick) {
                      return Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: const Color(0xFFFFFFFF),
                          decoration: isOnHover
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                      );
                    },
                    onClick: () {
                      Navigator.of(context).pushNamed(TermsPage.route);
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
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: const Color(0xFFFFFFFF),
                          decoration: isOnHover
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                      );
                    },
                    onClick: () {
                      Navigator.of(context).pushNamed(PrivacyPage.route);
                    },
                    showUrl: PrivacyPage.route,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25,
          right: 25,
          width: 44,
          height: 44,
          child: MouseWidget(
            widget: (bool isOnHover, bool isOnClick) {
              return Image.asset(
                'assets/images/social_discord.png',
                fit: BoxFit.fitHeight,
              );
            },
            onClick: () async {
              await launchUrl(Uri.parse('https://discord.gg/'));
            },
            showUrl: 'https://discord.gg/',
            useBaseHost: false,
          ),
        ),
        Positioned(
          bottom: 25,
          right: 80,
          width: 44,
          height: 44,
          child: MouseWidget(
            widget: (bool isOnHover, bool isOnClick) {
              return Image.asset(
                'assets/images/social_twitter.png',
                fit: BoxFit.fitHeight,
              );
            },
            onClick: () async {
              await launchUrl(Uri.parse('https://twitter.com/'));
            },
            showUrl: 'https://twitter.com/',
            useBaseHost: false,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        desktopScreen: _buildDesktop(context),
        tabletScreen: _buildTablet(context),
        mobileScreen: _buildMobile(context),
      ),
    );
  }
}

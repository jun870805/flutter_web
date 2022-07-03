import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../includes.dart';

List<BoxShadow> _mapButtonBoxShadow = [
  BoxShadow(
    color: const Color(0XFF000000).withOpacity(0.15),
    offset: const Offset(0.0, 4.0), //陰影y軸偏移量
    blurRadius: 4, //陰影模糊程度
    spreadRadius: 0, //陰影擴散程度
  ),
];

class HomePage extends StatefulWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ContentWidgetType _clickContentWidgetType;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    _clickContentWidgetType = ContentWidgetType.aboutMe;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _mapButtonWidget(
      BuildContext context, ContentWidgetType buttonWidgetType, double scale) {
    String text = '';
    switch (buttonWidgetType) {
      case ContentWidgetType.aboutMe:
        text = 'About Me';
        break;
      case ContentWidgetType.personalExperience:
        text = 'Personal Experience';
        break;
      case ContentWidgetType.skills:
        text = 'Skills';
        break;
      case ContentWidgetType.sideProject:
        text = 'Side Project';
        break;
    }

    return MouseWidget(
      widget: (bool isOnHover, bool isOnClick) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: _mapButtonBoxShadow,
            color: isOnHover
                ? const Color(0XFF00C0C2).withOpacity(0.6)
                : const Color(0xFFFFFFFF).withOpacity(0.6),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.0 * scale,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              height: 1.6,
              color:
                  isOnHover ? const Color(0xFFFFFFFF) : const Color(0xFF030F2B),
            ),
          ),
        );
      },
      onClick: () {
        _clickContentWidgetType = buttonWidgetType;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _width = _size.width;
    const double _bgWidth = 1440;
    const double _bgHeight = 768;
    final double _scale = _width / _bgWidth;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: _bgWidth * _scale,
            height: _bgHeight * _scale,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/home_background.png'),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFD1B7FC),
                  const Color(0xFFE3D5FA).withOpacity(0),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0 * _scale,
                  right: 112 * _scale,
                  width: 392 * _scale,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0.0),
                      end: const Offset(1, 0.0),
                    ).animate(
                      _animationController..repeat(reverse: true),
                      // CurvedAnimation(
                      //   parent: _animationController..repeat(reverse: true),
                      //   curve: Curves.elasticIn,
                      // ),
                    ),
                    child: Image.asset(
                      'assets/images/cloud_pink.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: 0 * _scale,
                  width: 350 * _scale,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 704 * _scale,
                  left: 76 * _scale,
                  child: MouseWidget(
                    widget: (bool isOnHover, bool isOnClick) {
                      return SizedBox(
                        width: 40 * _scale,
                        height: 40 * _scale,
                        child: Image.asset(
                          isOnHover
                              ? 'assets/images/social_discord.png'
                              : 'assets/images/map_discord.png',
                          fit: BoxFit.cover,
                        ),
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
                  top: 704 * _scale,
                  left: 24 * _scale,
                  child: MouseWidget(
                    widget: (bool isOnHover, bool isOnClick) {
                      return SizedBox(
                        width: 40 * _scale,
                        height: 40 * _scale,
                        child: Image.asset(
                          isOnHover
                              ? 'assets/images/social_twitter.png'
                              : 'assets/images/map_twitter.png',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    onClick: () async {
                      await launchUrl(Uri.parse('https://twitter.com/'));
                    },
                    showUrl: 'https://twitter.com/',
                    useBaseHost: false,
                  ),
                ),
                Positioned(
                  top: 302 * _scale,
                  left: 600 * _scale,
                  width: 112 * _scale,
                  height: 40 * _scale,
                  child: _mapButtonWidget(
                      context, ContentWidgetType.aboutMe, _scale),
                ),
                Positioned(
                  top: 350 * _scale,
                  left: 912 * _scale,
                  width: 151 * _scale,
                  height: 40 * _scale,
                  child: _mapButtonWidget(
                      context, ContentWidgetType.personalExperience, _scale),
                ),
                Positioned(
                  top: 466 * _scale,
                  left: 240 * _scale,
                  width: 109 * _scale,
                  height: 40 * _scale,
                  child: _mapButtonWidget(
                      context, ContentWidgetType.skills, _scale),
                ),
                Positioned(
                  top: 519 * _scale,
                  left: 716 * _scale,
                  width: 194 * _scale,
                  height: 40 * _scale,
                  child: _mapButtonWidget(
                      context, ContentWidgetType.sideProject, _scale),
                ),
                Positioned(
                  top: 88 * _scale,
                  left: 24 * _scale,
                  width: 18 * _scale,
                  height: 528 * _scale,
                  child: Image.asset(
                    'assets/images/indicator.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  top: 89 * _scale,
                  left: 50 * _scale,
                  width: 300 * _scale,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'When tomorrow turns in today, yesterday, and someday that no more important in your memory, we suddenly realize that wer pushed for ward by time, This is not a train in still in which you may feel for ward when another train goes by, It is the truth that we\'ve all grown up, And we become different.',
                        textStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.0 * _scale,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          color: const Color(0xFF030F2B),
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ],
            ),
          ),
          ContentWidget(
            contentWidgetType: _clickContentWidgetType,
          )
        ],
      ),
    );
  }
}

enum ContentWidgetType { aboutMe, personalExperience, skills, sideProject }

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.contentWidgetType,
  }) : super(key: key);

  final ContentWidgetType contentWidgetType;

  Widget _aboutMeWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('About Me'),
      ],
    );
  }

  Widget _personalExperienceWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Personal Experience'),
      ],
    );
  }

  Widget _skillsWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Skills'),
      ],
    );
  }

  Widget _sideProjectWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Side Project'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();

    switch (contentWidgetType) {
      case ContentWidgetType.aboutMe:
        child = _aboutMeWidget(context);
        break;
      case ContentWidgetType.personalExperience:
        child = _personalExperienceWidget(context);
        break;
      case ContentWidgetType.skills:
        child = _skillsWidget(context);
        break;
      case ContentWidgetType.sideProject:
        child = _sideProjectWidget(context);
        break;
    }
    return Container(
      padding: const EdgeInsets.only(top: 32),
      height: 300,
      child: child,
    );
  }
}

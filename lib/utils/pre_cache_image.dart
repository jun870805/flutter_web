import 'package:flutter/material.dart';

const assetsImages = [
  'cloud_pink.png',
  'cloud.png',
  'home_background.png',
  'indicator.png',
  'logo.png',
  'map_discord.png',
  'map_twitter.png',
  'navigation_background.png',
  'social_discord.png',
  'social_twitter.png',
];

class PreCacheImage {
  Future loadAll(BuildContext context) async {
    for (String e in assetsImages) {
      // 預快取圖片
      await precacheImage(AssetImage("assets/images/$e"), context);
    }
  }
}

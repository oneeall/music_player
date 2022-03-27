import 'package:flutter/material.dart';
import 'package:music_player/features/home_player/home_player_page.dart';
import 'package:music_player/ui/theme/app_theme.dart';

void main() {
  runApp(const MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light().data,
      home: const HomePlayerPage(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/data/repository/media_repository_impl.dart';
import 'package:music_player/features/home_player/view_model/home_player_view_model.dart';

import 'widgets/bottom_media_player.dart';
import 'widgets/inherited_media.dart';
import 'widgets/media_builder.dart';
import 'widgets/search_box.dart';

class HomePlayerPage extends StatefulWidget {
  const HomePlayerPage({Key? key}) : super(key: key);

  @override
  State<HomePlayerPage> createState() => _HomePlayerPageState();
}

class _HomePlayerPageState extends State<HomePlayerPage> {
  late final AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedMedia(
      viewModel: HomePlayerViewModel(
        mediaRepositoryImpl: MediaRepositoryImpl(
          MediaDataSourceImpl(),
        ),
        audioPlayer: audioPlayer
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Music Player'),
          bottom: const PreferredSize(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchBox(),
            ),
            preferredSize: Size(double.infinity, 50),
          ),
        ),
        body: const MediaBuilder(),
        bottomNavigationBar: const BottomMediaPlayer(),
        floatingActionButton: const FloatActionButton(),
      ),
    );
  }
}

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        InheritedMedia.of(context)
            .viewModel
            .mediaProvider
            .fetchingMusic(term: 'guns n roses');
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_player/data/model/media_response.dart';

import 'inherited_media.dart';

class TrailingIcon extends StatelessWidget {
  const TrailingIcon({Key? key, required this.media}) : super(key: key);

  final Media? media;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: InheritedMedia
          .of(context)
          .viewModel
          .selectedMediaProvider,
      builder: (context, child) {
        var selectedMedia =
            InheritedMedia
                .of(context)
                .viewModel
                .selectedMediaProvider
                .media;
        if (selectedMedia == media) {
          return const Icon(Icons.play_circle_fill_outlined);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

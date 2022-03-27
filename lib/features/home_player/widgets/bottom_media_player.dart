import 'package:flutter/material.dart';
import 'package:music_player/data/model/media_response.dart';

import 'inherited_media.dart';

class BottomMediaPlayer extends StatelessWidget {
  const BottomMediaPlayer({Key? key}) : super(key: key);

  static const _heightPercentage = 0.16;
  static const _minHeight = 0.0;

  double _getHeightMedia(BuildContext context, Media? media) {
    if (media != null) {
      return MediaQuery.of(context).size.height *
          BottomMediaPlayer._heightPercentage;
    } else {
      return BottomMediaPlayer._minHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        var selectedMedia =
            InheritedMedia.of(context).viewModel.selectedMediaProvider.media;

        return AnimatedContainer(
          height: _getHeightMedia(context, selectedMedia),
          duration: const Duration(milliseconds: 350),
          child: Material(
            elevation: 8.0,
            child: SafeArea(
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 2,
                      ),
                      child: Text(
                        selectedMedia?.trackname ?? '',
                        maxLines: 1,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      child: const Text('stop'),
                      onPressed: () {
                        InheritedMedia.of(context)
                            .viewModel
                            .selectedMediaProvider
                            .clearMedia();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      animation: InheritedMedia.of(context).viewModel.selectedMediaProvider,
    );
  }
}

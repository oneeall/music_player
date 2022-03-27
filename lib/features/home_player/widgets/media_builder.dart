import 'package:flutter/material.dart';
import 'package:music_player/data/model/media_response.dart';
import 'package:music_player/foundation/result_response/result_response_builder.dart';

import 'inherited_media.dart';
import 'music_list_tile.dart';

class MediaBuilder extends StatelessWidget {
  const MediaBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: InheritedMedia.of(context).viewModel.mediaProvider,
      builder: (context, child) {
        return ResultResponseBuilder<MediaResponse?>(
          response:
              InheritedMedia.of(context).viewModel.mediaProvider.responseState,
          whenLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          whenDataNull: const Center(
            child: Text('search the artist..'),
          ),
          whenSuccess: (data) {
            var results = data?.results;
            if (results == null) {
              return const Center(
                child: Text(
                  'search the artist..',
                ),
              );
            }

            if (results.isEmpty) {
              return const Center(
                child: Text(
                  'search the artist..',
                ),
              );
            }

            return ListView.builder(
              itemCount: data?.resultcount ?? 0,
              itemBuilder: (context, index) {
                var media = data?.results?[index];
                return MusicListTile(
                  media: media,
                );
              },
            );
          },
          whenError: (error, data) {
            return Center(
              child: Text(
                error.toString(),
              ),
            );
          },
        );
      },
    );
  }
}

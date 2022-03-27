import 'package:flutter/material.dart';
import 'package:music_player/data/model/media_response.dart';

import 'inherited_media.dart';
import 'trailing_icon.dart';

class MusicListTile extends StatelessWidget {
  const MusicListTile({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media? media;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(media?.trackname ?? '-'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(media?.artistname ?? '-'),
          Text(media?.collectionname ?? '-', style: Theme
              .of(context)
              .textTheme
              .caption,),
        ],
      ),
      onTap: () {
        if (media != null) {
          InheritedMedia
              .of(context)
              .viewModel
              .selectedMediaProvider
              .selectMedia(media!);
        }
      },
      leading: CircleAvatar(
        child: Image.network(media?.artworkurl60 ?? ''),
      ),
      trailing: TrailingIcon(
        media: media,
      ),
    );
  }
}

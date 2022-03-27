import 'package:music_player/data/model/media_response.dart';
import 'package:music_player/data/repository/media_repository.dart';
import 'package:music_player/data/source/media_data_source_impl.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaDataSourceImpl mediaDataSourceImpl;


  MediaRepositoryImpl(this.mediaDataSourceImpl);

  @override
  Future<MediaResponse> obtainMusic(String term) async{
    var media = 'music';

    var mediaResponse = await mediaDataSourceImpl.getMedia(media: media, term: term);

    return mediaResponse;
  }
}




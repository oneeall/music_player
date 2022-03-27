import 'package:music_player/data/model/media_response.dart';
import 'package:music_player/data/remote/api_manager.dart';
import 'package:music_player/data/repository/media_repository.dart';

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


abstract class MediaDataSource {
  Future<MediaResponse> getMedia({required String media, required String term,});
}

class MediaDataSourceImpl implements MediaDataSource {

  @override
  Future<MediaResponse> getMedia({required String media, required String term}) async {
    var authority = 'itunes.apple.com';
    var path = '/search';
    var queryParams = {
      'term': term,
      'media': media
    };
    var response = await ApiManager.getMedia(authority, path, queryParams);
    return MediaResponse.fromJson(response);
  }

}
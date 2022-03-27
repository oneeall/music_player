import 'package:music_player/data/model/media_response.dart';
import 'package:music_player/data/remote/api_manager.dart';

import 'media_data_source.dart';

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

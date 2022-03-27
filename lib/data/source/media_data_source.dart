import 'package:music_player/data/model/media_response.dart';

abstract class MediaDataSource {
  Future<MediaResponse> getMedia({required String media, required String term,});
}

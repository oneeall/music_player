import 'package:music_player/data/model/media_response.dart';

abstract class MediaRepository {
  Future<MediaResponse> obtainMusic(String term);
}
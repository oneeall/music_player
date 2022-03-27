import 'package:flutter/foundation.dart';
import 'package:music_player/data/app_error.dart';
import 'package:music_player/data/model/media_response.dart';
import 'package:music_player/data/repository/media_repository_impl.dart';
import 'package:music_player/foundation/result_response/result_response_mixin.dart';

class MediaProvider extends ChangeNotifier
    with ResultResponseMixin<MediaResponse> {
  final MediaRepositoryImpl _mediaRepositoryImpl;

  MediaProvider(this._mediaRepositoryImpl);

  Future<void> fetchingMusic({
    required String term,
  }) async {
    showLoadingState();

    MediaResponse? response;
    try {
      response = await _mediaRepositoryImpl.obtainMusic(term);
    } catch (e) {
      showErrorState(error: AppError(e), data: response);
    } finally {
      showResultState(data: response);
    }
  }
}

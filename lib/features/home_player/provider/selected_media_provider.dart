import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/data/model/media_response.dart';

class SelectedMediaProvider extends ChangeNotifier {
  final AudioPlayer? _audioPlayer;

  SelectedMediaProvider(this._audioPlayer);

  Media? _media;

  Media? get media => _media;

  void selectMedia(Media media) {
    _media = media;

    audioPlayerSetSource().then(
      (isSetup) {
        if (isSetup) {
          playAudio();
        } else {
          stopAudio();
        }
      },
    );

    notifyListeners();
  }

  Future<bool> audioPlayerSetSource() async {
    bool isSetup = false;
    try {
      await _audioPlayer?.setAudioSource(
        ConcatenatingAudioSource(
          children: [
            AudioSource.uri(Uri.parse(_media?.previewurl ?? '')),
          ],
        ),
      );
      isSetup = true;
    } catch (e) {
      isSetup = false;
    }

    return isSetup;
  }

  Future<void> playAudio() async {
    await _audioPlayer?.play();
  }

  Future<void> stopAudio() async {
    await _audioPlayer?.stop();
  }

  void clearMedia() async {
    await stopAudio();
    _media = null;
    notifyListeners();
  }
}

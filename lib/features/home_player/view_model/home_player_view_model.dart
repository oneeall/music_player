import 'package:just_audio/just_audio.dart';
import 'package:music_player/data/repository/media_repository_impl.dart';
import 'package:music_player/features/home_player/provider/media_provider.dart';
import 'package:music_player/features/home_player/provider/selected_media_provider.dart';

class HomePlayerViewModel {
  late MediaProvider mediaProvider;
  late SelectedMediaProvider selectedMediaProvider;

  HomePlayerViewModel({
    required MediaRepositoryImpl mediaRepositoryImpl,
    required AudioPlayer audioPlayer,
  }) {
    mediaProvider = MediaProvider(mediaRepositoryImpl);
    selectedMediaProvider = SelectedMediaProvider(audioPlayer);
  }
}

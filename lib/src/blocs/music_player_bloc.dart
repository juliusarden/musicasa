import 'package:musicasa/src/models/music_metadata_model.dart';

import '../models/music_player_model.dart';
import 'package:rxdart/rxdart.dart';

class MusicPlayerBloc {
  final _musicPlayerPublisher = BehaviorSubject<MusicPlayerModel>();

  Stream<MusicPlayerModel> get musicPlayer => _musicPlayerPublisher.stream;

  updateMusicPlayer(MusicPlayerModel musicPlayerModel) async {
    _musicPlayerPublisher.sink.add(musicPlayerModel);
  }

  updateSelectedMusic(MusicMetadata musicMetadata) async {
    _musicPlayerPublisher.sink
        .add(MusicPlayerModel(selectedMusic: musicMetadata));
  }

  dispose() {
    _musicPlayerPublisher.close();
  }
}

final musicPlayerBloc = MusicPlayerBloc();

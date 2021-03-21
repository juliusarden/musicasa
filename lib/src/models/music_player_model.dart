import 'music_metadata_model.dart';

class MusicPlayerModel {
  MusicMetadata _selectedMusic;

  MusicMetadata get selectedMusic => _selectedMusic;

  MusicPlayerModel({MusicMetadata selectedMusic}) {
    this._selectedMusic = selectedMusic;
  }
}

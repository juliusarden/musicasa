import './music_metadata_model.dart';

class SearchModel {
  int _resultCount;
  List<MusicMetadata> _results = [];

  SearchModel(int resultCount, List<MusicMetadata> results) {
    this._resultCount = resultCount;
    this._results = results;
  }

  SearchModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _resultCount = parsedJson['resultCount'];
    List<MusicMetadata> tempMusicMetadata = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      MusicMetadata result = MusicMetadata(parsedJson['results'][i]);
      tempMusicMetadata.add(result);
    }
    _results = tempMusicMetadata;
  }

  int get resultCount => _resultCount;
  List<MusicMetadata> get results => _results;
}

class MusicMetadata {
  int _trackId;
  String _artistName;
  String _collectionName;
  String _trackName;
  String _previewUrl;
  String _artworkUrl100;
  bool _selected;

  MusicMetadata(Map<String, dynamic> result) {
    _trackId = result['trackId'];
    _artistName = result['artistName'];
    _collectionName = result['collectionName'];
    _trackName = result['trackName'];
    _previewUrl = result['previewUrl'];
    _artworkUrl100 = result['artworkUrl100'];
    _selected = false;
  }
  MusicMetadata.fromMusicMetadata(MusicMetadata oldMetadata, bool selected) {
    _artistName = oldMetadata.artistName;
    _collectionName = oldMetadata.collectionName;
    _trackName = oldMetadata.trackName;
    _previewUrl = oldMetadata.previewUrl;
    _artworkUrl100 = oldMetadata.artworkUrl;
    _selected = selected;
  }

  int get trackId => _trackId;
  String get artistName => _artistName;
  String get collectionName => _collectionName;
  String get trackName => _trackName;
  String get previewUrl => _previewUrl;
  String get artworkUrl => _artworkUrl100;
  bool get isSelected => _selected;
}

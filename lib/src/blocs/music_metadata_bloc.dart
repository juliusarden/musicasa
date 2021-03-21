import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/search_model.dart';

class MusicMetadataBloc {
  final _repository = Repository();
  final _musicMetadataFetcher = PublishSubject<SearchModel>();

  Stream<SearchModel> get allMusicMetadata => _musicMetadataFetcher.stream;

  fetchAllMusicMetadata(term) async {
    SearchModel searchModel = await _repository.fetchMusicList(term);
    _musicMetadataFetcher.sink.add(searchModel);
  }

  dispose() {
    _musicMetadataFetcher.close();
  }
}

final musicMetadataBloc = MusicMetadataBloc();

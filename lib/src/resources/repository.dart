import '../models/search_model.dart';
import '../resources/search_api_provider.dart';

class Repository {
  final searchApiProvider = SearchApiProvider();

  Future<SearchModel> fetchMusicList(term) =>
      searchApiProvider.fetchMusicList(term, 'artistTerm');
}

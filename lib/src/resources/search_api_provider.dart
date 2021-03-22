import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/search_model.dart';

class SearchApiProvider {
  Client client = Client();
  String hostname = 'itunes.apple.com';
  SearchApiProvider({this.client});

  Future<SearchModel> fetchMusicList(String term, String attribute) async {
    print('Fetching music list $term');
    final response = await this.client.get(
        Uri.https(hostname, '/search', {
          'country': 'ID',
          'media': 'music',
          'attribute':
              attribute == '' || attribute == null ? 'artistTerm' : attribute,
          'term': term,
        }),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        });
    print(response.body.toString());
    if (response.statusCode == 200) {
      SearchModel model = SearchModel.fromJson(json.decode(response.body));
      if (model.resultCount == 0) {
        throw Exception('Please enter artist name');
      }
      return model;
    } else {
      throw Exception(
          'Failed to fetch music list. Please check your internet connection');
    }
  }
}

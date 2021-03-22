import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

import '../../../lib/src/resources/search_api_provider.dart';
import '../../../lib/src/models/search_model.dart';

void main() {
  test(
      'Given a successful request but empty results, it should say \'Please enter artist name\'',
      () async {
    final SearchApiProvider searchApiProvider = SearchApiProvider(
      client: MockClient((request) async {
        return Response(
            jsonEncode({
              'resultCount': 0,
              'results': [],
            }),
            200);
      }),
    );
    expect(() => searchApiProvider.fetchMusicList('Afgan', ''),
        throwsA(isInstanceOf<Exception>()));
  });

  test('Given a successful request with 1 result, it should return SearchModel',
      () async {
    final responseObject = {
      'resultCount': 1,
      'results': [
        {
          'trackId': 1,
          'trackName': 'trackName',
          'artistName': 'artistName',
          'collectionName': 'collectionname',
          'previewUrl': 'previewUrl',
          'artworkUrl100': 'artwork',
        }
      ],
    };
    final SearchApiProvider searchApiProvider = SearchApiProvider(
      client: MockClient((request) async {
        return Response(jsonEncode(responseObject), 200);
      }),
    );
    final response = await searchApiProvider.fetchMusicList('Afgan', '');

    var searchModelExpected = SearchModel.fromJson(responseObject);
    expect(response.resultCount, searchModelExpected.resultCount);
    for (int i = 0; i < searchModelExpected.results.length; i++) {
      expect(
          response.results[i].trackId, searchModelExpected.results[i].trackId);
      expect(response.results[i].trackName,
          searchModelExpected.results[i].trackName);
      expect(response.results[i].collectionName,
          searchModelExpected.results[i].collectionName);
      expect(response.results[i].artworkUrl,
          searchModelExpected.results[i].artworkUrl);
    }
  });
}

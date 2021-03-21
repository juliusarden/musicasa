import '../blocs/music_metadata_bloc.dart';
import 'package:flutter/material.dart';
import 'package:musicasa/src/blocs/search_artist_bloc.dart';

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchBarState();
  }
}

class SearchBarState extends State<SearchBar> {
  SearchArtistBloc _textBloc;
  @override
  void initState() {
    super.initState();
    this._textBloc = SearchArtistBloc();
    this._textBloc.textStream.listen((String text) {
      musicMetadataBloc.fetchAllMusicMetadata(text);
    });
  }

  @override
  void dispose() {
    this._textBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Search Artist'),
      onChanged: (String text) => this._textBloc.updateText(text),
    );
  }
}

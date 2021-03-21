import 'package:flutter/material.dart';
import 'blocs/music_metadata_bloc.dart';
import 'blocs/music_player_bloc.dart';
import 'ui/music_player.dart';
import 'ui/music_list.dart';
import 'ui/search_bar.dart';

class MusicasaApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MusicasaAppState();
  }
}

class MusicasaAppState extends State<MusicasaApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Musicasa',
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Musicasa'),
          ),
          body: Container(
            child: Center(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: SearchBar(),
                ),
                Expanded(child: MusicList()),
                MusicPlayer(),
              ],
            )),
          ),
        ));
  }

  @override
  void dispose() {
    musicMetadataBloc.dispose();
    musicPlayerBloc.dispose();
    super.dispose();
  }
}

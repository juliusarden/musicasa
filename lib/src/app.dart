import 'package:flutter/material.dart';
import 'ui/music_list.dart';

class MusicasaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Musicasa',
        theme: ThemeData.dark(),
        home: Scaffold(
          body: MusicList(),
        ));
  }
}

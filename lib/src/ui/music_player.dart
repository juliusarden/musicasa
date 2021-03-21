import 'package:fluttertoast/fluttertoast.dart';

import '../blocs/music_player_bloc.dart';
import '../models/music_player_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MusicPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MusicPlayerState();
  }
}

class MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void buttonPressed(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: musicPlayerBloc.musicPlayer.shareValueSeeded(null),
      builder: (context, AsyncSnapshot<MusicPlayerModel> snapshot) {
        if (snapshot.data != null) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.fast_rewind),
                  onPressed: () => buttonPressed('Rewind button pressed'),
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () => buttonPressed('Play button pressed'),
                ),
                IconButton(
                  icon: Icon(Icons.fast_forward),
                  onPressed: () => buttonPressed('Forward button pressed'),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

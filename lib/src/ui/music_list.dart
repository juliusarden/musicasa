import 'package:flutter/material.dart';
import '../models/search_model.dart';
import '../models/music_metadata_model.dart';
import '../blocs/music_metadata_bloc.dart';
import '../models/music_player_model.dart';
import '../blocs/music_player_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MusicList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MusicListState();
  }
}

class MusicListState extends State<MusicList> {
  @override
  void initState() {
    super.initState();
    musicMetadataBloc.fetchAllMusicMetadata('Afgan');
  }

  @override
  void dispose() {
    musicMetadataBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<MusicListViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Music'),
      ),
      body: StreamBuilder(
        stream: Rx.combineLatest2(
          musicMetadataBloc.allMusicMetadata,
          musicPlayerBloc.musicPlayer.shareValueSeeded(null),
          (SearchModel result, MusicPlayerModel musicPlayer) {
            if (result.results.length > 0) {
              return SearchModel(
                  result.resultCount,
                  result.results.map((MusicMetadata metadata) {
                    if (musicPlayer != null &&
                        musicPlayer.selectedMusic != null) {
                      print(
                          'Selected music ${musicPlayer.selectedMusic?.trackName}');
                      if (metadata.trackId ==
                          musicPlayer.selectedMusic?.trackId) {
                        return MusicMetadata.fromMusicMetadata(metadata, true);
                      }
                    }
                    return metadata;
                  }).toList());
            }
            return result;
          },
        ),
        builder: (context, AsyncSnapshot<SearchModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<SearchModel> snapshot) {
    List<MusicMetadata> results = snapshot.data.results;
    return ListView.separated(
      itemCount: snapshot.data.results.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        onTap: () {
          print('Tapped at index $index');
          musicPlayerBloc.updateSelectedMusic(results[index]);
        },
        leading: Image.network(results[index].artworkUrl, fit: BoxFit.contain),
        title: OverflowText(results[index].trackName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        subtitle: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverflowText(results[index].artistName),
                  if (results[index].collectionName != null)
                    OverflowText(results[index].collectionName),
                ],
              ),
            ),
          ],
        ),
        trailing: results[index].isSelected == true
            ? Icon(Icons.audiotrack, color: Colors.green)
            : null,
      ),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

class OverflowText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final Key key;

  OverflowText(
    this.data, {
    this.style,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      overflow: TextOverflow.ellipsis,
      style: this.style,
      key: this.key,
      textAlign: TextAlign.left,
    );
  }
}

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class SearchArtistBloc {
  final defaultSearch = 'Afgan';
  var _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream
      .shareValueSeeded(defaultSearch)
      .debounceTime(Duration(milliseconds: 500));

  updateText(String text) {
    // print('$text');
    _textController.sink.add(text);
  }

  dispose() {
    _textController.close();
  }
}

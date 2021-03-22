# musicasa

A simple music list app that pulls music metadata from Apple itunes made using flutter.

You can access this on web by visiting https://flutter.lol/musicasa

When app is started, it will show the tracks by 'Afgan'.
The default artist is curerntly set to 'Afgan'.
There is 500ms debounce on search term before we hit the Apple Itunes API.

When you select a track:
- The green 'Music' icon is shown next to the track you have selected
- The music player at the bottom will pop up. Currently it does not do anything other than showing toast message when the button is pressed.

## To start the project
Make sure you have flutter installed on your environment. See flutter.dev to find instruction on how to install flutter.
As of writing, the latest tested running flutter version is:
```
Flutter 2.0.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 4d7946a68d (3 days ago) • 2021-03-18 17:24:33 -0700
Engine • revision 3459eb2436
Tools • Dart 2.12.2
```

- Navigate to the project on terminal
- run `flutter pub get`
- run `flutter run` (or specify your device)

## State Management
This project state management is using BLoC concept with RxDart.
Project structure:
- lib:
  -  main.dart <- entry point / runApp()
  - src:
    - blocs <- BLoC publisher
    - models <- type of data parsed across classes
    - resources <- files where API calls is made
    - ui <- All custom widgets
- test: <- Test files are located here. As limited time, I only implemented few test cases.

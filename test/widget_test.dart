// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:music_player/data/remote/api_manager.dart';
import 'package:music_player/features/home_player/widgets/media_builder.dart';
import 'package:music_player/features/home_player/widgets/search_box.dart';
import 'package:music_player/main.dart';

import 'mock_data/data.dart';

void main() {

  setUpAll(() {
    ApiManager(mockClient: MockClient((res) async {
      const mapJson = mockData;
      return Response(json.encode(mapJson), 200);
    }));
  });

  Future<void> playerMusicWidgetTester(WidgetTester tester) async {
    // ARRANGE
    const musicPlayerWidget = MusicPlayer();
    var appBarLabel = 'Music Player';
    var searchBoxLabel = 'search media';
    var searchTheArtist = 'search the artist..';

    var searchingArtist = 'Slash';

    // Build our app and trigger a frame
    await tester.pumpWidget(
      musicPlayerWidget
    );

    // Expected you have the music player page include with
    // app bar text with 'Music Player'
    // search bar with text 'search media'
    // and the body, show widget with text 'search the artist..'
    
    var musicPlayer = find.byWidget(musicPlayerWidget);
    var appBar = find.widgetWithText(AppBar, appBarLabel);
    var searchBox = find.widgetWithText(SearchBox, searchBoxLabel);
    var mediaBuilder = find.widgetWithText(MediaBuilder, searchTheArtist);

    // expect to find the items on screen
    expect(musicPlayer, findsOneWidget);
    expect(appBar, findsOneWidget);
    expect(searchBox, findsOneWidget);
    expect(mediaBuilder, findsOneWidget);

    // do search music
    await tester.enterText(searchBox, searchingArtist);
    await tester.testTextInput.receiveAction(TextInputAction.done);

    // rebuild the widget after the state has changed
    await tester.pump();

    // expected to find the search box with searchingArtist
    // and find the list view of media

    var searchBoxWithText = find.widgetWithText(SearchBox, searchingArtist);

    var listOfMedia = find.byType(ListView);

    expect(
      searchBoxWithText,
      findsOneWidget
    );

    expect(
      listOfMedia,
      findsOneWidget
    );
  }


  testWidgets('player music', playerMusicWidgetTester);
}
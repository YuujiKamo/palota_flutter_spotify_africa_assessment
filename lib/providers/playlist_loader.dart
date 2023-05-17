import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/models/playlist_model.dart';
import 'package:http/http.dart';

class PlayListLoader with ChangeNotifier {
  //Fields
  List<Playlist> playlists = [];
  bool _isLoading = false;
  bool _isError = false;

  //Getters
  bool get isLoading => _isLoading;
  bool get isError => _isError;

  //Functions
  void toggleLoader() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  Future<void> getPlayListData(String categoryName) async {
    print("Method Running: getPlayListData");
    toggleLoader();
    await get(
      Uri.parse(
        "https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/$categoryName/playlists",
      ),
      headers: {
        "x-functions-key":
            "_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ=="
      },
    ).timeout(const Duration(seconds: 5)).then(
      (response) {
        if (response.statusCode == 200) {
          //Parse JSON Data
          final mapPlayListData = jsonDecode(response.body);
          print(mapPlayListData);
          for (int i = 0;
              i <
                  (mapPlayListData["playlists"]["items"] as List<dynamic>)
                      .length;
              i++) {
            playlists.add(
              Playlist(
                description: mapPlayListData["playlists"]["items"][i]
                    ["description"],
                id: mapPlayListData["playlists"]["items"][i]["id"],
                name: mapPlayListData["playlists"]["items"][i]["name"],
                tracksUrl: mapPlayListData["playlists"]["items"][i]["tracks"]
                    ["href"],
                imageUrl: mapPlayListData["playlists"]["items"][i]["images"][0]
                    ["url"],
              ),
            );
          }
        }
        _isError = false;
      },
    ).onError(
      (error, stackTrace) {
        _isError = true;
        print("error: getPlayListData");
        print(error.toString());
        print(stackTrace);
      },
    );
    toggleLoader();
  }
}

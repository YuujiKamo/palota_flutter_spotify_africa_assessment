import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/models/song_model.dart';
import 'package:http/http.dart';

class PlaylistSongLoader with ChangeNotifier {
  Map<dynamic, dynamic> playlistItemsDataMap = {};
  List<Song> _songsList = [];

  bool _isLoading = false;

  //getters
  bool get isLoading => _isLoading;
  List<Song> get songsList => _songsList;

  //Functions

  clearPlaylist() {
    _songsList = [];
  }

  toggleLoadingStatus() {
    _isLoading = _isLoading;
    notifyListeners();
  } // end toggleLoadingStatus

  List<String> getArtistNames(List<dynamic> artists) {
    List<String> names = [];

    for (var i = 0;
        i <
            (playlistItemsDataMap["tracks"]["items"][i]["track"]["album"]
                    ["artists"] as List<dynamic>)
                .length;
        i++) {
      names.add(artists[i]["name"]);
    }

    return names;
  }

  Future<void> getPlaylistSongs(String playlistID) async {
    toggleLoadingStatus();
    await get(
      Uri.parse(
        "https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/playlists/$playlistID",
      ),
      headers: {
        "x-functions-key":
            "_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ=="
      },
    )
        .timeout(
      const Duration(seconds: 5),
    )
        .then((res) {
      if (res.statusCode == 200) {
        playlistItemsDataMap = jsonDecode(res.body);
        List<Song> dummyList = [];

        //Clear if any songs are in the playlist
        clearPlaylist();

        //Add songs to list songs
        for (int i = 0;
            i <
                (playlistItemsDataMap["tracks"]["items"] as List<dynamic>)
                    .length;
            i++) {
          dummyList.add(
            Song(
              name: playlistItemsDataMap["tracks"]["items"][i]["track"]["name"],
              artistNames: getArtistNames(
                (playlistItemsDataMap["tracks"]["items"][i]["track"]["album"]
                    ["artists"] as List<dynamic>),
              ),
              durationInMilliseconds: playlistItemsDataMap["tracks"]["items"][i]
                  ["track"]["duration_ms"],
              imageUrl: playlistItemsDataMap["tracks"]["items"][0]["track"]
                  ["album"]["images"][2]["url"],
            ),
          );
          _songsList = [...dummyList];
        }
      }
    }).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
      },
    );
    toggleLoadingStatus();
    notifyListeners();
  }
}

/*
     for (int i = 0;i < (mapPlayListData["playlists"]["items"] as List<dynamic>).length;i++) {
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
*/

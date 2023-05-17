import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/providers/playlist_song_loader.dart';
import 'package:provider/provider.dart';

import 'track_playlist_list_tile.dart';

class TrackPlayListView extends StatefulWidget {
  const TrackPlayListView({
    super.key,
    required this.playlistID,
  });

  final String playlistID;

  @override
  State<TrackPlayListView> createState() => _TrackPlayListViewState();
}

class _TrackPlayListViewState extends State<TrackPlayListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PlaylistSongLoader>().getPlaylistSongs(widget.playlistID);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    context.read<PlaylistSongLoader>().clearPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistSongLoader>(
      builder: (context, value, child) {
        if (value.isLoading & value.songsList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (!value.isLoading && value.songsList.isEmpty) {
          return const Center(
              child: Text(
            "Oops, could not load songs.\nPull down to refresh",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ));
        } else {
          return ListView.builder(
            itemCount: value.songsList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => TrackPlaylistListTile(
              artistNames: value.songsList[index].artistNames,
              imageUrl: value.songsList[index].imageUrl,
              trackName: value.songsList[index].name,
              trackLength:
                  value.songsList[index].durationInMilliseconds.toString(),
            ),
          );
        }
      },
    );
  }
}

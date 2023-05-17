import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/models/playlist_model.dart';
import 'package:flutter_spotify_africa_assessment/providers/playlist_loader.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/playlist_song_loader.dart';
import '../components/featured_artist_custom_grid_title.dart';
import '../components/featured_artists_bar.dart';
import '../components/featured_artists_grid.dart';
import '../components/followers_bar.dart';
import '../components/gradient_divider.dart';
import '../components/playlist_description_text_widget.dart';
import '../components/playlist_page_center_header_tile.dart';
import '../components/track_playlist_view.dart';

//TODO: complete this page - you may choose to change it to a stateful widget if necessary
class SpotifyPlaylist extends StatelessWidget {
  SpotifyPlaylist({Key? key, required this.playlistId})
      : super(
          key: key,
        );

  final String playlistId;
  late Playlist currentPlaylist;

  Playlist getPlayistData(BuildContext context) {
    return context
        .read<PlayListLoader>()
        .playlists
        .firstWhere((playlist) => playlist.id == playlistId);
  }

  @override
  Widget build(BuildContext context) {
    currentPlaylist = getPlayistData(context);
    //print(currentPlaylist.id);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.1),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<PlaylistSongLoader>().getPlaylistSongs(playlistId);
        },
        child: ListView(
          children: [
            PlaylistPageCenterHeaderTile(currentPlaylist: currentPlaylist),
            PlaylistDescriptionWidget(currentPlaylist: currentPlaylist),
            const FollowersBar(
              followersCount: "286,850 Followers",
            ),
            const GradientDivider(),
            TrackPlayListView(
              playlistID: playlistId,
            ),
            const FeaturedArtistsBar(),
            const FeaturedArtistGrid()
          ],
        ),
      ),
    );
  }
}

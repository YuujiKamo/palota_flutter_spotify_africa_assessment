import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/playlist_loader.dart';
import 'category_playlist_grid_tile.dart';

class PlaylistGrid extends StatelessWidget {
  const PlaylistGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: Implement Lazy loading
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<PlayListLoader>(
          builder: (context, value, child) => value.isLoading
              //Center Progress indicator
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemCount: value.playlists.length,
                  itemBuilder: (context, index) => CategoryPlaylistGridTile(
                    name: value.playlists[index].name,
                    tracksUrl: value.playlists[index].tracksUrl,
                    id: value.playlists[index].id,
                    imageUrl: value.playlists[index].imageUrl,
                  ),
                ),
        ),
      ),
    );
  }
}

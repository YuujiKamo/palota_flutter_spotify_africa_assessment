import 'package:flutter/material.dart';

import '../../../../../models/playlist_model.dart';

class PlaylistDescriptionWidget extends StatelessWidget {
  const PlaylistDescriptionWidget({
    super.key,
    required this.currentPlaylist,
  });

  final Playlist currentPlaylist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        currentPlaylist.description,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

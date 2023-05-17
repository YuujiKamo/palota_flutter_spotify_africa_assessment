import 'package:flutter/material.dart';

import '../../../../../colors.dart';
import '../../../../../models/playlist_model.dart';

class PlaylistPageCenterHeaderTile extends StatelessWidget {
  const PlaylistPageCenterHeaderTile({
    super.key,
    required this.currentPlaylist,
  });

  final Playlist currentPlaylist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: SizedBox(
        height: 300,
        width: 300,
        child: GridTile(
          footer: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              currentPlaylist.name,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          child: Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.only(
              left: 4,
              right: 4,
              top: 4,
              bottom: 57,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Card(
                child: SizedBox(
                  height: 200,
                  width: 263.52,
                  child: Image.network(
                    currentPlaylist.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

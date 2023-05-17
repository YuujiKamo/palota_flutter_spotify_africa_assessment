import 'package:flutter/material.dart';

class TrackPlaylistListTile extends StatelessWidget {
  const TrackPlaylistListTile({
    super.key,
    required this.imageUrl,
    required this.trackName,
    required this.artistNames,
    required this.trackLength,
  });

  final String imageUrl;
  final String trackName;
  final List<String> artistNames;
  final String trackLength;

  String joinArtistNames() {
    String names = "";

    for (int i = 0; i < artistNames.length; i++) {
      //Only add a comma if the name isnt the last one
      names += artistNames[i] + (i == artistNames.length - 1 ? "" : ", ");
    }

    return names;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl),
          ),
          title: Text(trackName),
          subtitle: Text(joinArtistNames()),
          trailing: Text(trackLength),
        ),
      ],
    );
  }
}

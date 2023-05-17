import 'package:flutter/material.dart';

import 'featured_artist_custom_grid_title.dart';

class FeaturedArtistGrid extends StatelessWidget {
  const FeaturedArtistGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          //Create Parameters for the grid tiles
          FeatureArtistCustomGridTile(),
          FeatureArtistCustomGridTile(),
          FeatureArtistCustomGridTile(),
          FeatureArtistCustomGridTile()
        ],
      ),
    );
  }
}

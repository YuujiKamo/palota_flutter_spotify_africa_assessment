import 'package:flutter/material.dart';

class FeatureArtistCustomGridTile extends StatelessWidget {
  const FeatureArtistCustomGridTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //TODO: Remove Hard Coded
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 120,
              width: 120,
              child: Image.network(
                  "https://i.scdn.co/image/ab67616d0000b273c8433bb9222e3160f3629b63"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Arya Star"),
          )
        ],
      ),
    );
  }
}

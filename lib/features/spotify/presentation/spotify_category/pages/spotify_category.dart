import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/misc/helpers.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:provider/provider.dart';

import '../components/app_bar_flexible_space_container.dart';
import '../components/category_playlist_header.dart';

// TODO: fetch and populate playlist info and allow for click-through to detail
// Feel free to change this to a stateful widget if necessary
class SpotifyCategory extends StatefulWidget {
  final String categoryId;

  const SpotifyCategory({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<SpotifyCategory> createState() => _SpotifyCategoryState();
}

class _SpotifyCategoryState extends State<SpotifyCategory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryLoader>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(value.category?.name ?? "{CatergoryName}"),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.about),
            ),
          ],
          flexibleSpace: const AppBarFlexibleSpaceContainer(),
        ),
        body: Column(
          children: [
            CategoryPlaylistHeader(
              iconUrl: value.category!.iconUrl,
              categoryName: value.category?.name,
            ),
          ],
        ),
      ),
    );
  }
}

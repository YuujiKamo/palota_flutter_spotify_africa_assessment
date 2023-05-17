import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/providers/category_loader.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/playlist_loader.dart';
import '../components/app_bar_flexible_space_container.dart';
import '../components/category_playlist_grid_tile.dart';
import '../components/category_playlist_header.dart';
import '../components/playlist_grid.dart';

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
    context.read<PlayListLoader>().getPlayListData(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Add Lazy Loading to improve user experience
    return Consumer<CategoryLoader>(
      builder: (context, value, child) => RefreshIndicator(
        displacement: MediaQuery.of(context).size.width * 0.3,
        onRefresh: () async {
          await context
              .read<PlayListLoader>()
              .getPlayListData(widget.categoryId);
        },
        child: Scaffold(
          appBar: !value.isError
              ? AppBar(
                  title: Text(value.category?.name ?? "{CategoryName}"),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.info_outline),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRoutes.about),
                    ),
                  ],
                  flexibleSpace: const AppBarFlexibleSpaceContainer(),
                )
              : null,
          body: value.isError
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "Ooops, an error occured. pull down to refresh or connect to the internet",
                    textAlign: TextAlign.center,
                  )),
                )
              : ListView(
                  physics: const BouncingScrollPhysics(
                      parent: ClampingScrollPhysics()),
                  children: [
                    CategoryPlaylistHeader(
                      iconUrl: value.category!.iconUrl,
                      categoryName: value.category?.name,
                    ),
                    const PlaylistGrid()
                  ],
                ),
        ),
      ),
    );
  }
}

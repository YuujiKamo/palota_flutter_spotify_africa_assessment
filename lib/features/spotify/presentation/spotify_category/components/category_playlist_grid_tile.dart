import 'package:flutter/material.dart';

import '../../../../../colors.dart';

class CategoryPlaylistGridTile extends StatelessWidget {
  const CategoryPlaylistGridTile({
    Key? key,
    required this.name,
    required this.tracksUrl,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);

  final String name;

  final String tracksUrl;
  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 4,
          left: 4,
          right: 4,
          bottom: 28,
        ),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 187,
        width: 163,
        child: SizedBox(
          height: 155,
          width: 155,
          child: Card(
            elevation: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

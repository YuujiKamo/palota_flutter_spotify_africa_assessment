import 'package:flutter/material.dart';

import '../../../../../colors.dart';

class CategoryPlaylistHeader extends StatelessWidget {
  const CategoryPlaylistHeader({
    super.key,
    required this.iconUrl,
    required this.categoryName,
  });

  final String? iconUrl;
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        bottom: 16,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                  height: 64, width: 64, child: Image.network(iconUrl!)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoryName ?? "{CategoryName}",
                //TODO: Add Robot Font
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Text(
              "playlists",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}

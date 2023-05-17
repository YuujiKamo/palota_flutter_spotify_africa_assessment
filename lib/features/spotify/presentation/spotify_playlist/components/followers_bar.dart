import 'package:flutter/material.dart';

import '../../../../../colors.dart';

class FollowersBar extends StatelessWidget {
  const FollowersBar({
    super.key,
    required this.followersCount,
  });

  final String followersCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          height: 32,
          width: MediaQuery.of(context).size.width * 0.40,
          padding: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                followersCount,
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

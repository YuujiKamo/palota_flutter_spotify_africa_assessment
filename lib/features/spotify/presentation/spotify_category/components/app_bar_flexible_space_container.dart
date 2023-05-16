import 'package:flutter/material.dart';

import '../../../../../colors.dart';

class AppBarFlexibleSpaceContainer extends StatelessWidget {
  const AppBarFlexibleSpaceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            AppColors.blue,
            AppColors.cyan,
            AppColors.green,
          ],
        ),
      ),
    );
  }
}

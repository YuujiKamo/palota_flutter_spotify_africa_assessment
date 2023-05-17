import 'package:flutter/material.dart';

import '../../../../../colors.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              AppColors.blue,
              AppColors.cyan,
              AppColors.green,
            ],
          ),
        ),
      ),
    );
  }
}

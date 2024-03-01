import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class MCartCounterIcon extends StatelessWidget {
  const MCartCounterIcon({
    super.key, required this.onPressed, this.iconColor = MColors.white,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.shopping_bag, color: MColors.white)),
        Positioned(
          right: 0,
          child: Container(
            width: 18, height: 18,
            decoration: BoxDecoration(
              color: MColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        ),
      ],
    );
  }
}
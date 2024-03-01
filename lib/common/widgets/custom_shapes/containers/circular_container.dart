import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class MCircularContainer extends StatelessWidget {
  const MCircularContainer({
    super.key,
    this.width = 450,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.bgColor = MColors.white,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: MColors.textWhite.withOpacity(0.1)
      ),
      child: child,
    );
  }
}
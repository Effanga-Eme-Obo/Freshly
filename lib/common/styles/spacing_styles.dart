import 'package:flutter/material.dart';
import '../../utils/constants//sizes.dart';

class MSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: MSizes.appBarheight,
    left: MSizes.defaultSpace,
    bottom: MSizes.defaultSpace,
    right: MSizes.defaultSpace,
  );
}
import 'package:freshly/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class MFormDivider extends StatelessWidget {
  const MFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: dark ? MColors.darkGrey : MColors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5)),
        const Text('  Or  ',
            style: TextStyle(fontFamily: 'DM Sans')),
        Flexible(
            child: Divider(
                color: dark ? MColors.darkGrey : MColors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 60)),
      ],
    );
  }
}
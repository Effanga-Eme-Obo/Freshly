import 'package:freshly/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/constants/colors.dart';

class MLoginHeader extends StatelessWidget {
  const MLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image(height: 150, image: AssetImage(' ')),
          SizedBox(height: MSizes.spaceBtwnSections),
          SizedBox(height: MSizes.spaceBtwnSections),
          Text(Mtexts.loginTitle,
              style: TextStyle( fontFamily: 'DM Serif', fontSize: 34, color: MColors.accentColor)),
          //const SizedBox(height: MSizes.spaceBtwnSections),
          //Text(Mtexts.loginSubtitle,
              //style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
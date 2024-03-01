import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class MHomeAppbar extends StatelessWidget {
  const MHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Mtexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: MColors.grey)),
          Text(Mtexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: MColors.white)),
        ],
      ),
      actions: [
        //MCartCounterIcon(onPressed: (){}, iconColor: MColors.white),
      ],
    );
  }
}
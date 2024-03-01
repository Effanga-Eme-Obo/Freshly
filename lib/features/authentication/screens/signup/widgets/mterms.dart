import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class Mterms extends StatelessWidget {
  const Mterms({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value){}, activeColor: MColors.success)),
        const SizedBox(width: MSizes.spaceBtwnItems),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: '${Mtexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: '${Mtexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? MColors.white : MColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark? MColors.white : MColors.primaryColor
            )),
            TextSpan(text: '${Mtexts.and} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: Mtexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark? MColors.white : MColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark? MColors.white : MColors.primaryColor
            )),
          ],
        ),
        ),
      ],
    );
  }
}
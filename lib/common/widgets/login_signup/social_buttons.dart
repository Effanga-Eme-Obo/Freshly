import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class MSocialButtons extends StatelessWidget {
  const MSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        /// Google
        SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(onPressed: (){}, icon: Image.asset('assets/logos/google24.png'), label: const Text('Continue with Google'))),
        const SizedBox(height: MSizes.spaceBtwnItems),

        /// Facebook
        SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(onPressed: () {}, icon: Image.asset('assets/logos/facebook30.png'), label: const Text('Continue with Facebook'))),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class Loader extends StatelessWidget {
  final bool? isLinear;
  const Loader({ this.isLinear});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLinear == null || isLinear == false
          ? const CircularProgressIndicator(
              color: Palette.buttonColor,
            )
          : const LinearProgressIndicator(
              color: Palette.buttonColor,
            ),
    );
  }
}

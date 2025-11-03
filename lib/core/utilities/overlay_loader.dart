import 'package:flutter/material.dart';

import 'loader.dart';

class LoadingOverlay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x80FFFFFF),
      child: const Center(
        child: Loader(),
      ),
    );
  }
}

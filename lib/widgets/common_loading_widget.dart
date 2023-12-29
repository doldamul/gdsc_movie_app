import 'package:flutter/material.dart';

class CommonLoadingWidget extends StatelessWidget {
  final Function()? onBuild;

  const CommonLoadingWidget({
    super.key,
    this.onBuild,
  });

  @override
  Widget build(BuildContext context) {
    if (onBuild != null) {
      onBuild!();
    }
    return Center(
      child: CircularProgressIndicator(
        color: Colors.yellow.shade700,
      )
    );
  }
}
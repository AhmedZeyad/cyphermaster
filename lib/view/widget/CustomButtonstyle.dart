import 'package:flutter/material.dart';

import '../../core/consetvar.dart';

class CustomButtonStyle extends StatelessWidget {
  final Widget child;

  const CustomButtonStyle({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        width: width * 0.15,
        height: width * 0.033,
        decoration: ContanerDecoration,
        child: child);
  }
}

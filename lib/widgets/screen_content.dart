import 'package:flutter/material.dart';
import 'package:onboarding_page/utils/constants.dart';

class ScreenContent extends StatelessWidget {
  final int index;
  const ScreenContent({super.key, required this.index, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: Constants.backgroundColor),
      ),
      
      child: Center(
        child: Text(
          'Screen $index',
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

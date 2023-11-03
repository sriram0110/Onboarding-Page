import 'package:flutter/material.dart';
import 'package:onboarding_page/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: Constants.backgroundColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home Screen',
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24),
          )
        ],
      ),
    );
  }
}

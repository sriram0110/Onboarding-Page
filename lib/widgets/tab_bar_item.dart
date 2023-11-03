import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboarding_bloc.dart';

class TabBarItem extends StatelessWidget {
  final int index;
  final PageController pageController;

  const TabBarItem(this.index, this.pageController, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<OnboardingBloc>(context).add(ChangeScreenEvent(index));
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      },
      child: Container(
        width: 90,
        height: 4,
        color: BlocProvider.of<OnboardingBloc>(context, listen: true)
                    .currentIndex ==
                index
            ? Colors.black
            : Colors.grey,
      ),
    );
  }
}

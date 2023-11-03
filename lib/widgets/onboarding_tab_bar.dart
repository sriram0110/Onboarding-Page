import 'package:flutter/material.dart';
import 'package:onboarding_page/widgets/tab_bar_item.dart';

class OnboardingTabBar extends StatelessWidget {
  final PageController pageController;
  final  List<Widget> tabBarItem = [];

   OnboardingTabBar(this.pageController,{super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(4, (index) {
        return TabBarItem(index, pageController);
      }),
    );
  }
  
}
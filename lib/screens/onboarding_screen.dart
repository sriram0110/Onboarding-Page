import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_page/screens/home_screen.dart';
import 'package:onboarding_page/utils/constants.dart';

import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_tab_bar.dart';
import '../widgets/screen_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Widget> screens =
      List.generate(4, (index) => ScreenContent(index: index + 1));

  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoAnimation();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoAnimation() {
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (_pageController.page != screens.length - 1) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: Constants.backgroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: Column(
            children: [
              OnboardingTabBar(_pageController),
              Expanded(
                child: PageView.builder(
                  itemCount: screens.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return screens[index % screens.length];
                  },
                  onPageChanged: (index) {
                    BlocProvider.of<OnboardingBloc>(context)
                        .add(ChangeScreenEvent(index));
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

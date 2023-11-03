part of 'onboarding_bloc.dart';

abstract class OnboardingState {}

class CurrentScreenChangedState extends OnboardingState {
  final int currentIndex;
  CurrentScreenChangedState(this.currentIndex);
}
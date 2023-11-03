part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {}

class ChangeScreenEvent extends OnboardingEvent {
  final int index;
  ChangeScreenEvent(this.index);
}


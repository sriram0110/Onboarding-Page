import 'package:bloc/bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int currentIndex = 0;

  OnboardingBloc() : super(CurrentScreenChangedState(0)) {
    on<ChangeScreenEvent>(_onChangeScreenEvent);
  }

  void _onChangeScreenEvent(
      ChangeScreenEvent event, Emitter<OnboardingState> emit) {
    currentIndex = event.index;
    emit(CurrentScreenChangedState(currentIndex));
  }

  int get getCurrentIndex => currentIndex;
}

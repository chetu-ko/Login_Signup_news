part of 'toggle_button_cubit.dart';

@immutable
abstract class NewsButtonState extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleButtonInitial extends NewsButtonState {
  final bool isNews = true;
  final bool isFev = false;
  final String text = 'News';

  ToggleButtonInitial();

  @override
  List<Object> get props => [
        isNews,
        isFev,
        text,
      ];
}

class ToggleButtonStateUpdated extends NewsButtonState {
  final bool isNews;
  final bool isFev;
  final String text;

  ToggleButtonStateUpdated(
    this.isFev,
    this.isNews,
    this.text,
  );

  @override
  List<Object> get props => [
        isNews,
        isFev,
        text,
      ];
}

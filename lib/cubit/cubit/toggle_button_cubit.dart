import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'toggle_button_state.dart';

class ToggleButtonCubit extends Cubit<NewsButtonState> {
  ToggleButtonCubit() : super(ToggleButtonInitial());

  void toggleNews() => emit(ToggleButtonStateUpdated(true, false, 'News'));

  void toggleFev() => emit(ToggleButtonStateUpdated(false, true, 'Fev'));
}

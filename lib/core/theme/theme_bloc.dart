import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class ThemeEvent {}
class ToggleTheme extends ThemeEvent {}

// State
class ThemeState {
  final bool isDark;
  const ThemeState({required this.isDark});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDark: true)) {
    on<ToggleTheme>((_, emit) => emit(ThemeState(isDark: !state.isDark)));
  }
}

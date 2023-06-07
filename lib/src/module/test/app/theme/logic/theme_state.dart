part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.theme = const CustomTheme(color: Colors.red, mode: true),
  });

  final CustomTheme theme;

  @override
  List<Object?> get props => [theme];
  
}

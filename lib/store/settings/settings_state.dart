class SettingsState {
  final bool lightTheme;
  final double fontSize;

  const SettingsState({
    required this.lightTheme,
    required this.fontSize,
  });

  factory SettingsState.initial() {
    return const SettingsState(lightTheme: false, fontSize: 1.0);
  }

  SettingsState copyWith({bool? lightTheme, double? fontSize}) {
    return SettingsState(
      lightTheme: lightTheme ?? this.lightTheme,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

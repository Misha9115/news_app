class SettingsState {
  final bool lightTheme;

  const SettingsState({
    required this.lightTheme,
  });

  factory SettingsState.initial() {
    return const SettingsState(lightTheme: false);
  }

  SettingsState copyWith({bool? lightTheme}) {
    return SettingsState(
      lightTheme: lightTheme ?? this.lightTheme,
    );
  }
}

import 'dart:ui';

class LanguageState {
  final Locale language;

  const LanguageState({
    required this.language,
  });

  factory LanguageState.initial() {
    return const LanguageState(language: Locale("en"));
  }

  LanguageState copyWith({Locale? language}) {
    return LanguageState(
      language: language ?? this.language,
    );
  }
}

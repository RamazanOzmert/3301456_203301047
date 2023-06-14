import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languagesProvider =
    StateNotifierProvider<LanguagesNotifier, List<Languages>>((ref) {
  return LanguagesNotifier(languages: [
    const Languages(
      languages: 'Türkçe',
    ),
  ]);
});

@immutable
class Languages {
  final String languages;

  const Languages({
    required this.languages,
  });

  Languages copyWith({
    String? languages,
  }) {
    return Languages(
      languages: languages ?? this.languages,
    );
  }
}

class LanguagesNotifier extends StateNotifier<List<Languages>> {
  LanguagesNotifier({languages}) : super(languages);

  void add(Languages languages) {
    state = [...state, languages];
  }

  void changeLanguages({required String languages}) {
    Languages lan = Languages(languages: languages);
    state = [lan];
  }
}

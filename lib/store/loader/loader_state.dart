import 'dart:collection';

import 'package:news_paper/store/loader/loader_actions.dart';
import 'package:news_paper/store/reducer.dart';

class LoaderState {
  final bool paginationLoader;

  const LoaderState({
    required this.paginationLoader,
  });

  factory LoaderState.initial() {
    return const LoaderState(paginationLoader: false);
  }

  LoaderState copyWith({bool? paginationLoader}) {
    return LoaderState(
      paginationLoader: paginationLoader ?? this.paginationLoader,
    );
  }

  LoaderState reducer(dynamic action) {
    return Reducer<LoaderState>(
      actions: HashMap.from({
        ChangePaginationLoader: (dynamic action) => _savePaginationAction(action as ChangePaginationLoader),
      }),
    ).updateState(action, this);
  }

  LoaderState _savePaginationAction(ChangePaginationLoader action) {
    return copyWith(paginationLoader: action.paginationLoader);
  }
}

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
}

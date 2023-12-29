interface class SearchMoviesEvent {
  const SearchMoviesEvent();
}

class SearchMoviesOnQueryChangeEvent extends SearchMoviesEvent {
  final String query;

  const SearchMoviesOnQueryChangeEvent({
    required this.query,
  });
}

class SearchMoviesOnSearchEvent extends SearchMoviesEvent {
  const SearchMoviesOnSearchEvent();
}

class SearchMoviesGetNextPageEvent extends SearchMoviesEvent {
  const SearchMoviesGetNextPageEvent();
}
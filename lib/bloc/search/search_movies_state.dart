import 'package:equatable/equatable.dart';
import 'package:gdsc_movie_app/enums/common_loading_type.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_list_model.dart';

class SearchMoviesState extends Equatable {
  final CommonLoadingType status;
  final String? message;
  final String query;
  final TMDBMovieListModel? searchResults;

  const SearchMoviesState({
    required this.status,
    this.message,
    required this.query,
    this.searchResults,
  });

  const SearchMoviesState.init() : this(
    status: CommonLoadingType.init,
    message: null,
    query: '',
    searchResults: const TMDBMovieListModel.init(),
  );

  SearchMoviesState copyWith({
    CommonLoadingType? status,
    String? message,
    String? query,
    TMDBMovieListModel? searchResults,
  }) => SearchMoviesState(
      status: status ?? this.status,
      message: message ?? this.message,
      query: query ?? this.query,
      searchResults: searchResults ?? this.searchResults,
  );

  @override
  List<Object?> get props => [
    status,
    message,
    query,
    searchResults,
  ];
}
import 'package:equatable/equatable.dart';
import 'package:gdsc_movie_app/enums/common_loading_type.dart';
import 'package:gdsc_movie_app/enums/tmdb_movie_list_type.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_list_model.dart';

class HomeMoviesState extends Equatable {
  final Map<TMDBMovieListType, CommonLoadingType> status;
  final String? message;
  final Map<TMDBMovieListType, TMDBMovieListModel> category;

  const HomeMoviesState({
    required this.status,
    this.message,
    required this.category,
  });

  const HomeMoviesState.init() : this(
    status: const {
      TMDBMovieListType.day: CommonLoadingType.init,
      TMDBMovieListType.week: CommonLoadingType.init,
      TMDBMovieListType.nowPlaying: CommonLoadingType.init,
      TMDBMovieListType.popular: CommonLoadingType.init,
      TMDBMovieListType.topRated: CommonLoadingType.init,
      TMDBMovieListType.upComing: CommonLoadingType.init,
    },
    message: null,
    category: const {},
  );

  HomeMoviesState copyWith({
    Map<TMDBMovieListType, CommonLoadingType>? status,
    String? message,
    Map<TMDBMovieListType, TMDBMovieListModel>? category,
  }) => HomeMoviesState(
      status: status ?? this.status,
      message: message ?? this.message,
      category: category ?? this.category,
  );

  @override
  List<Object?> get props => [
    status,
    message,
    category,
  ];
}
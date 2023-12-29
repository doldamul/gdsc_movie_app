import 'package:gdsc_movie_app/enums/tmdb_movie_list_type.dart';

interface class HomeMoviesEvent {
  const HomeMoviesEvent();
}

class HomeMoviesGetEvent extends HomeMoviesEvent {
  final TMDBMovieListType type;

  const HomeMoviesGetEvent({
    required this.type,
  });
}
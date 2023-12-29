import 'package:bloc/bloc.dart';
import 'package:gdsc_movie_app/bloc/home/home_movies_event.dart';
import 'package:gdsc_movie_app/bloc/home/home_movies_state.dart';
import 'package:gdsc_movie_app/enums/tmdb_movie_list_type.dart';
import 'package:gdsc_movie_app/enums/common_loading_type.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_list_model.dart';
import 'package:gdsc_movie_app/repositories/tmdb/tmdb_movie_repository.dart';

class HomeMoviesBloc extends Bloc<HomeMoviesEvent, HomeMoviesState> {
  final TMDBMovieRepository tmdbMovieRepository;

  HomeMoviesBloc({
    required this.tmdbMovieRepository,
  }) : super(const HomeMoviesState.init()) {
    on<HomeMoviesGetEvent>(_homeMoviesGetEventHandler);
  }

  Map<TMDBMovieListType, CommonLoadingType> _copyWithState({
    required Map<TMDBMovieListType, CommonLoadingType> prev,
    required TMDBMovieListType type,
    required CommonLoadingType newStatus,
  }) {
    Map<TMDBMovieListType, CommonLoadingType> result = {};
    result
      ..addEntries(prev.entries)
      ..[type] = newStatus;

    return result;
  }

  void _homeMoviesGetEventHandler(
    HomeMoviesGetEvent event,
    Emitter<HomeMoviesState> emit,
  ) async {
    emit(state.copyWith(
      status: _copyWithState(
        prev: state.status,
        type: event.type,
        newStatus: CommonLoadingType.loading,
      ),
    ));

    TMDBMovieListModel? result;
    try {
      switch (event.type) {
        case TMDBMovieListType.day:
        case TMDBMovieListType.week:
          result =
              await tmdbMovieRepository.getMovieTrendList(type: event.type);
          break;
        default:
          result = await tmdbMovieRepository.getMovieList(type: event.type);
      }
    } catch (e) {
      emit(state.copyWith(
        status: _copyWithState(
            prev: state.status,
            type: event.type,
            newStatus: CommonLoadingType.error,
        ),
        message: '${event.type.title} 데이터를 불러오는데 실패했습니다.\n${e.toString()}',
      ));
      return;
    }

    if (result == null) {
      emit(state.copyWith(
        status: _copyWithState(
          prev: state.status,
          type: event.type,
          newStatus: CommonLoadingType.error,
        ),
        message: '${event.type.title} 데이터를 불러오는데 실패했습니다.',
      ));
      return;
    }

    Map<TMDBMovieListType, TMDBMovieListModel> newCategory = {};
    newCategory
      ..addEntries(state.category.entries)
      ..addAll({event.type: result});

    emit(state.copyWith(
      status: _copyWithState(
        prev: state.status,
        type: event.type,
        newStatus: CommonLoadingType.loaded,
      ),
      message: null,
      category: newCategory,
    ));
  }
}
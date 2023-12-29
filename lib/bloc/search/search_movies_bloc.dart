import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_event.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_state.dart';
import 'package:gdsc_movie_app/enums/common_loading_type.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_list_model.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_listitem_model.dart';
import 'package:gdsc_movie_app/repositories/tmdb/tmdb_movie_repository.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final TMDBMovieRepository tmdbMovieRepository;

  SearchMoviesBloc({
    required this.tmdbMovieRepository,
  }) : super(const SearchMoviesState.init()) {
    on<SearchMoviesOnQueryChangeEvent>(_searchMoviesOnQueryChangeEventHandler);
    on<SearchMoviesOnSearchEvent>(_searchMoviesOnSearchEventHandler);
    on<SearchMoviesGetNextPageEvent>(_searchMoviesGetNextPageEventHandler);
  }

  void _searchMoviesOnQueryChangeEventHandler(
      SearchMoviesOnQueryChangeEvent event,
    Emitter<SearchMoviesState> emit,
  ) async {
    emit(state.copyWith(query: event.query));
  }

  void _searchMoviesOnSearchEventHandler(
      SearchMoviesOnSearchEvent event,
      Emitter<SearchMoviesState> emit,
      ) async {
    if (state.status == CommonLoadingType.loading) return;

    emit(state.copyWith(
      status: CommonLoadingType.loading,
      searchResults: const TMDBMovieListModel.init(),
    ));

    try {
      TMDBMovieListModel? result = await tmdbMovieRepository.getSearchMovie(query: state.query);

      emit(state.copyWith(
        status: CommonLoadingType.loaded,
        searchResults: result,
      ));
    } catch(e) {
      emit(state.copyWith(
        status: CommonLoadingType.error,
        message: '데이터를 불러오는데 실패했습니다.\n${e.toString()}',
      ));
    }
  }

  void _searchMoviesGetNextPageEventHandler(
      SearchMoviesGetNextPageEvent event,
    Emitter<SearchMoviesState> emit,
  ) async {
    if (state.status == CommonLoadingType.init) return;
    if (state.status == CommonLoadingType.loading) return;
    if (state.status == CommonLoadingType.neverUpdate) return;

    emit(state.copyWith(status: CommonLoadingType.loading));

    try {
      final newPage = state.searchResults?.page ?? 1;

      TMDBMovieListModel? result = await tmdbMovieRepository.getSearchMovie(
        query: state.query,
        page: newPage + 1,
      );

      if (result?.results?.isEmpty == true) {
        emit(state.copyWith(
          status: CommonLoadingType.neverUpdate,
        ));
        return;
      }

      List<TMDBMovieListItemModel> newList = [];
      newList
        ..addAll(state.searchResults?.results ?? [])
        ..addAll(result!.results ?? []);

      emit(state.copyWith(
        status: CommonLoadingType.loaded,
        searchResults: state.searchResults?.copyWith(
          page: result.page,
          results: newList,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CommonLoadingType.error,
        message: '데이터를 불러오는데 실패했습니다.\n${e.toString()}',
      ));
    }
  }
}

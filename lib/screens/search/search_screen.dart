import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_bloc.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_state.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_event.dart';
import 'package:gdsc_movie_app/constants/gaps.dart';
import 'package:gdsc_movie_app/enums/common_loading_type.dart';
import 'package:gdsc_movie_app/screens/search/widgets/search_listitem_widget.dart';
import 'package:gdsc_movie_app/widgets/common_input_widget.dart';
import 'package:gdsc_movie_app/widgets/common_loading_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  void _onChange(
    BuildContext context, {
    required String value,
  }) {
    context
      .read<SearchMoviesBloc>()
      .add(SearchMoviesOnQueryChangeEvent(query: value));
  }

  void _onSubmit(BuildContext context) {
    context
        .read<SearchMoviesBloc>()
        .add(const SearchMoviesOnSearchEvent());
  }

  void _onLoadMore(BuildContext context) {
    context
        .read<SearchMoviesBloc>()
        .add(const SearchMoviesGetNextPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    _onSubmit(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
          buildWhen: (previous, current) => previous.query != current.query,
          builder: (context, state) => CommonInputWidget(
            onSubmit: (_) => _onSubmit(context),
            onChange: (value) => _onChange(context, value: value),
            value: state.query,
            padding: EdgeInsets.zero,
          ),
        )
      ),
      body: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
        builder: (context, state) {
          if (state.status == CommonLoadingType.error) {
            return _errorBody(context, message: state.message);
          }

          return ListView(
            children: [
              for (var movieItem in state.searchResults?.results ?? [])
                SearchListItemWidget(movie: movieItem),
              Gaps.v10,
              if (state.status != CommonLoadingType.neverUpdate)
                CommonLoadingWidget( // 맨밑 위젯이 로드될 때 이벤트 발생
                  onBuild: () => _onLoadMore(context),
                )
            ],
          );
        },
      ),
    );
  }

  Widget _errorBody(
    BuildContext context, {
    String? message,
  }) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message ?? '오류가 발생했습니다.',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Gaps.v5,
            ElevatedButton(
              onPressed: () => _onSubmit(context),
              child: const Text('재시도'),
            ),
          ],
        )
    );
  }
}
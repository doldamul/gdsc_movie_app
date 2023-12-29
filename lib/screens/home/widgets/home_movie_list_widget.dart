import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_movie_app/bloc/home/home_movies_bloc.dart';
import 'package:gdsc_movie_app/bloc/home/home_movies_event.dart';
import 'package:gdsc_movie_app/bloc/home/home_movies_state.dart';
import 'package:gdsc_movie_app/constants/gaps.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';
import 'package:gdsc_movie_app/enums/common_loading_type.dart';
import 'package:gdsc_movie_app/enums/tmdb_movie_list_type.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_listitem_model.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_movie_card_widget.dart';
import 'package:gdsc_movie_app/widgets/common_loading_widget.dart';

class HomeMovieListWidget extends StatelessWidget {
  final TMDBMovieListType type;

  const HomeMovieListWidget({
    super.key,
    required this.type,
  });

  void _fetchData(BuildContext context) {
    context
        .read<HomeMoviesBloc>()
        .add(HomeMoviesGetEvent(type: type));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size5),
        color: Colors.blueGrey.shade300,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.size10),
            child: Text(
              type.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 180,
            child: BlocBuilder<HomeMoviesBloc, HomeMoviesState>(
              buildWhen: (previous, current) =>
                previous.status[type] != current.status[type],
              builder: (context, state) {
                switch (state.status[type]) {
                  case CommonLoadingType.error:
                    return _errorBody(context, message: state.message);
                  case CommonLoadingType.loaded:
                    return _loadedBody(
                      context,
                      results: state.category[type]?.results,
                    );
                  case CommonLoadingType.init:
                    _fetchData(context);
                    continue loading;
                  loading:
                  default:
                    return const CommonLoadingWidget();
                }
              },
            ),
          ),
        ],
      )
    );
  }

  Widget _loadedBody(
    BuildContext context, {
    List<TMDBMovieListItemModel>? results,
  }) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
      separatorBuilder: (context, index) => Gaps.h10,
      itemBuilder: (context, index) => HomeMovieCardWidget(
        title: results?[index].originalTitle ?? 'N/A',
        image: results?[index].posterPath ?? '',
      ),
      itemCount: results?.length ?? 0,
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
            onPressed: () => _fetchData(context),
            child: const Text('재시도'),
          )
        ],
      )
    );
  }
}
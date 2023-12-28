import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/enums/tmdb_movie_trend_type.dart';
import 'package:gdsc_movie_app/repositories/tmdb/tmdb_movie_repository.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_card_widget.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_sliver_appbar.dart';
import 'package:gdsc_movie_app/enums/tmdb_movie_list_type.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TMDBMovieRepository _repository = TMDBMovieRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          const HomeSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                HomeCardWidget(
                    title: '일간 트렌드',
                    futureFunction: () => _repository.getMovieTrendList(
                      type: TMDBMovieTrendType.day,
                    )
                ),
                HomeCardWidget(
                    title: '주간 트렌드',
                    futureFunction: () => _repository.getMovieTrendList(
                      type: TMDBMovieTrendType.week,
                    )
                ),
                HomeCardWidget(
                  title: '현재 상영 중',
                  futureFunction: () => _repository.getMovieList(
                    type: TMDBMovieListType.nowPlaying,
                  )
                ),
                HomeCardWidget(
                    title: '인기 영화',
                    futureFunction: () => _repository.getMovieList(
                      type: TMDBMovieListType.popular,
                    )
                ),
                HomeCardWidget(
                    title: '높은 평점 영화',
                    futureFunction: () => _repository.getMovieList(
                      type: TMDBMovieListType.topRated,
                    )
                ),
                HomeCardWidget(
                    title: '상영 예정',
                    futureFunction: () => _repository.getMovieList(
                      type: TMDBMovieListType.upComing,
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_movie_list_widget.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_sliver_appbar.dart';
import 'package:gdsc_movie_app/enums/tmdb_movie_list_type.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                const HomeMovieListWidget(
                  type: TMDBMovieListType.day,
                ),
                const HomeMovieListWidget(
                  type: TMDBMovieListType.week,
                ),
                const HomeMovieListWidget(
                  type: TMDBMovieListType.nowPlaying,
                ),
                const HomeMovieListWidget(
                  type: TMDBMovieListType.popular,
                ),
                const HomeMovieListWidget(
                  type: TMDBMovieListType.topRated,
                ),
                const HomeMovieListWidget(
                  type: TMDBMovieListType.upComing,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

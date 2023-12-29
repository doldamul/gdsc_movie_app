import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_card_widget.dart';
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
                const HomeCardWidget(
                  type: TMDBMovieListType.day,
                ),
                const HomeCardWidget(
                  type: TMDBMovieListType.week,
                ),
                const HomeCardWidget(
                  type: TMDBMovieListType.nowPlaying,
                ),
                const HomeCardWidget(
                  type: TMDBMovieListType.popular,
                ),
                const HomeCardWidget(
                  type: TMDBMovieListType.topRated,
                ),
                const HomeCardWidget(
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

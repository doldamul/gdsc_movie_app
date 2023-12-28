import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_listitem_model.dart';

class SearchListItemWidget extends StatelessWidget {
  final TMDBMovieListItemModel? movie;

  const SearchListItemWidget({
    super.key,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size72,
      child: Center(
        child: Text(
          movie?.originalTitle ?? 'N/A',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
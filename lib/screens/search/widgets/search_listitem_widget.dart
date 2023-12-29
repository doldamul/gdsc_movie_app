import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';
import 'package:gdsc_movie_app/constants/gaps.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_listitem_model.dart';
import 'package:gdsc_movie_app/constants/api_endpoints.dart';

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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size3),
        child: Row(
          children: [
            Gaps.h8,
            if (movie != null && movie?.posterPath != 'null' && movie?.posterPath != '')
              Row(
                children: [
                  Gaps.h8,
                  Container(
                      width: 50,
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.size3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size3),
                        color: Colors.blueGrey.shade300,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        '${ApiEndPoints.tmdbImage500}/${movie!.posterPath}',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fitWidth,
                      )
                  ),
                ],
              ),
            Gaps.h8,
            Text(
              movie?.originalTitle ?? 'N/A',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Gaps.h8,
          ],
        ),
      ),
    );
  }
}
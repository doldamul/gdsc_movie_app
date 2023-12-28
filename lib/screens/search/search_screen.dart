import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';
import 'package:gdsc_movie_app/repositories/tmdb/tmdb_movie_repository.dart';
import 'package:gdsc_movie_app/screens/search/widgets/search_listitem_widget.dart';
import 'package:gdsc_movie_app/widgets/common_input_widget.dart';

class SearchScreen extends StatefulWidget {
  final String? initValue;

  const SearchScreen({
    super.key,
    this.initValue,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TMDBMovieRepository _repository = TMDBMovieRepository();
  late String query;

  @override
  void initState() {
    super.initState();
    query = widget.initValue ?? '';
  }

  void _onSubmit(String value) {
    setState(() {
      query = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: CommonInputWidget(
          initValue: widget.initValue,
          padding: EdgeInsets.zero,
          onSubmit: _onSubmit,
        ),
      ),
      body: FutureBuilder(
        future: _repository.getSearchMovie(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) => SearchListItemWidget(
                movie: snapshot.data?.results?[index],
              ),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: Sizes.size1,
                color: Colors.black.withOpacity(0.3),
              ),
              itemCount: snapshot.data?.results?.length ?? 0,
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.yellow.shade700,
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_movie_app/bloc/home/home_movies_bloc.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_bloc.dart';
import 'package:gdsc_movie_app/repositories/tmdb/tmdb_movie_repository.dart';
import 'package:gdsc_movie_app/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => TMDBMovieRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeMoviesBloc(
                tmdbMovieRepository: context.read<TMDBMovieRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => SearchMoviesBloc(
              tmdbMovieRepository: context.read<TMDBMovieRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
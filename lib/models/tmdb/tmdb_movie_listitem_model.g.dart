// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie_listitem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMovieListItemModel _$TMDBMovieListItemModelFromJson(
        Map<String, dynamic> json) =>
    TMDBMovieListItemModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$TMDBMovieListItemModelToJson(
        TMDBMovieListItemModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

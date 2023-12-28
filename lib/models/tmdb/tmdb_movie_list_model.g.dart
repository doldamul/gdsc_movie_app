// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TMDBMovieListModel _$TMDBMovieListModelFromJson(Map<String, dynamic> json) =>
    TMDBMovieListModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => TMDBMovieListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$TMDBMovieListModelToJson(TMDBMovieListModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tmdb_movie_listitem_model.g.dart';

@JsonSerializable()
class TMDBMovieListItemModel extends Equatable {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  final int? id;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  const TMDBMovieListItemModel({
    this.adult,
    this.backdropPath,
    this.posterPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
  });

  factory TMDBMovieListItemModel.fromJson(Map<String, dynamic> json) =>
      _$TMDBMovieListItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TMDBMovieListItemModelToJson(this);

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    posterPath,
    genreIds,
    id,
    originalTitle,
    overview,
    releaseDate,
    voteAverage,
    voteCount,
  ];
}

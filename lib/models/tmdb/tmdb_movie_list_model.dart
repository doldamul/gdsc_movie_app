import 'package:equatable/equatable.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_listitem_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tmdb_movie_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TMDBMovieListModel extends Equatable {
  final int page;
  final List<TMDBMovieListItemModel>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  const TMDBMovieListModel({
    required this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  const TMDBMovieListModel.init() : this(
    page: 0,
    results: const [],
  );

  factory TMDBMovieListModel.fromJson(Map<String, dynamic> json) =>
      _$TMDBMovieListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TMDBMovieListModelToJson(this);

  TMDBMovieListModel copyWith({
    int? page,
    List<TMDBMovieListItemModel>? results,
    int? totalPages,
    int? totalResults,
  }) => TMDBMovieListModel(
    page: page ?? this.page,
    results: results ?? this.results,
    totalPages: totalPages ?? this.totalPages,
    totalResults: totalResults ?? this.totalResults,
  );

  @override
  List<Object?> get props => [
    page,
    results,
    totalPages,
    totalResults,
  ];
}
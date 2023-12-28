import 'package:equatable/equatable.dart';
import 'package:gdsc_movie_app/models/tmdb/tmdb_movie_listitem_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tmdb_movie_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TMDBMovieListModel extends Equatable {
  final int? page;
  final List<TMDBMovieListItemModel>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  const TMDBMovieListModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TMDBMovieListModel.fromJson(Map<String, dynamic> json) =>
      _$TMDBMovieListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TMDBMovieListModelToJson(this);

  @override
  List<Object?> get props => [
    page,
    results,
    totalPages,
    totalResults,
  ];
}
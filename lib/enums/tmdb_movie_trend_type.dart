enum TMDBMovieTrendType {
  day('day'),
  week('week');

  final String endPoint;

  const TMDBMovieTrendType(this.endPoint);
}
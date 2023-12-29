enum TMDBMovieListType {
  nowPlaying('now_playing', '현재 상영 중'),
  popular('popular', '인기 영화'),
  topRated('top_rated', '높은 평점 영화'),
  upComing('upcoming', '상영 예정'),
  day('day', '일간 트렌드'),
  week('week', '주간 트렌드');

  final String endPoint;
  final String title;

  const TMDBMovieListType(
    this.endPoint,
    this.title,
  );
}
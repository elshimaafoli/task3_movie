class MovieModel {
  String title;
  int id;
  double popularity;
  double vote;
  String img = "https://image.tmdb.org/t/p/w500/";
  MovieModel(
      {
         this.vote=0.5,
        required this.title,
        required this.id,
        required String image,
        required this.popularity}) {
    this.img = '${this.img}${image}';
  }
}

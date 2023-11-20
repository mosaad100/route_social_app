class PostEntity {
  String? title;
  String? body;
  bool like;
  int likes;

  PostEntity({this.title, this.body, this.like = false, this.likes = 0});
}

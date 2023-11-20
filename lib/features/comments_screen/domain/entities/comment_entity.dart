class CommentEntity {
  String? name;
  String? body;
  String? image;
  int likes;
  bool like;

  CommentEntity(
      {this.name, this.body, this.image, this.likes = 0, this.like = false});
}

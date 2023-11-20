import 'package:social_media_app/features/comments_screen/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  int? id;
  int? postId;
  String? email;

  CommentModel(
      {this.id, this.postId, super.name, this.email, super.body, super.image});

  CommentModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["post_id"] is int) {
      postId = json["post_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["body"] is String) {
      body = json["body"];
    }
  }
}

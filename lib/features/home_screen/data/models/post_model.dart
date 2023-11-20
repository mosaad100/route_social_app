import 'package:social_media_app/features/home_screen/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  String? message;
  int? id;
  int? userId;

  PostModel({this.message, this.id, this.userId, super.title, super.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["message"] is int) {
      message = json["message"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["body"] is String) {
      body = json["body"];
    }
  }
}

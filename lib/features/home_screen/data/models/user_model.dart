import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String? message;
  int? id;
  int? userId;
  String? email;
  String? gender;
  String? status;

  UserModel(
      {this.message,
      super.image,
      this.id,
      super.name,
      this.email,
      this.gender,
      this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["message"] is int) {
      message = json["message"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';

class CommentScreenData {
  PostDataEntity post;
  UserEntity currentUser;
  HomeScreenCubit homeScreenCubit;

  CommentScreenData({
    required this.post,
    required this.currentUser,
    required this.homeScreenCubit,
  });
}

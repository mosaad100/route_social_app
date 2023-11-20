// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/config/routes/app_routs.dart';
import 'package:social_media_app/core/reusable%20widgets/post_content.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_screen_data.dart';
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';

class PostCard extends StatelessWidget {
  final PostDataEntity postDataEntity;
  final UserEntity currentUserEntity;

  const PostCard({
    Key? key,
    required this.postDataEntity,
    required this.currentUserEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PostContent(functions: [
            () {
              CommentScreenData commentScreenData = CommentScreenData(
                  homeScreenCubit: BlocProvider.of<HomeScreenCubit>(context),
                  post: postDataEntity,
                  currentUser: currentUserEntity);
              Navigator.pushNamed(context, Routes.commentsScreen,
                  arguments: commentScreenData);
            }
          ], postDataEntity: postDataEntity),
        ));
  }
}

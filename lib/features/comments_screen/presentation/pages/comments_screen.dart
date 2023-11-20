import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/reusable%20widgets/post_content.dart';
import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/text_styles.dart';
import 'package:social_media_app/core/utils/texts.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_entity.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_screen_data.dart';
import 'package:social_media_app/features/comments_screen/presentation/cubit/comments_screen_cubit.dart';
import 'package:social_media_app/features/comments_screen/presentation/widgets/comment_card.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommentScreenData commentScreenData =
        ModalRoute.of(context)!.settings.arguments as CommentScreenData;

    return MultiBlocProvider(
      providers: [
        BlocProvider<CommentsScreenCubit>(
          create: (context) => CommentsScreenCubit()..getComments(),
        ),
        BlocProvider<HomeScreenCubit>.value(
            value: commentScreenData.homeScreenCubit),
      ],
      child: BlocConsumer<CommentsScreenCubit, CommentsScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetCommentsLoadingSate &&
              CommentsScreenCubit.get(context).comments.isEmpty) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryGreenColor,
                ),
              ),
            );
          } else if (state is GetCommentsFailureSate &&
              CommentsScreenCubit.get(context).comments.isEmpty) {
            return Scaffold(
              body: Center(
                child: Text(state.failures.toString()),
              ),
            );
          }
          return SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.blueGrey,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: Text(
                      'Posts',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  body: Card(
                    elevation: 5,
                    margin:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: SingleChildScrollView(
                      controller:
                          CommentsScreenCubit.get(context).listController,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.w, right: 15.w, top: 20.h),
                              child: PostContent(functions: [
                                () {
                                  CommentsScreenCubit.get(context)
                                      .goToTextField();
                                }
                              ], postDataEntity: commentScreenData.post),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: CommentsScreenCubit.get(context)
                                  .comments
                                  .length,
                              itemBuilder: (context, index) {
                                return CommentCard(
                                    comment: CommentsScreenCubit.get(context)
                                        .comments[index]);
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.h),
                              height: 2.h,
                              width: double.infinity,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      focusNode:
                                          CommentsScreenCubit.get(context)
                                              .focusNode,
                                      controller:
                                          CommentsScreenCubit.get(context)
                                              .commentController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: Texts.addComment,
                                          hintStyle: zillaSlab20W600().copyWith(
                                              color: AppColors.textLightColor)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('mmmmm');
                                      print(CommentsScreenCubit.get(context)
                                          .commentController
                                          .text);
                                      CommentEntity comment = CommentEntity(
                                          image: commentScreenData
                                              .currentUser.image,
                                          name: commentScreenData
                                              .currentUser.name);
                                      CommentsScreenCubit.get(context)
                                          .addComment(comment);
                                    },
                                    child: Icon(
                                      Icons.send,
                                      color: AppColors.primaryPurpleColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  )));
        },
      ),
    );
  }
}

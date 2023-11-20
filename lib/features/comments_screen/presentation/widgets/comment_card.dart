// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/functions/numbers_format.dart';
import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/text_styles.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_entity.dart';
import 'package:social_media_app/features/comments_screen/presentation/cubit/comments_screen_cubit.dart';

class CommentCard extends StatelessWidget {
  final CommentEntity comment;

  const CommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
              radius: 25.r,
              backgroundImage: AssetImage(comment.image ?? ''),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name ?? '',
                  style: zillaSlab20W600(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(comment.body ?? '', style: zillaSlab18W400()),
                Text('reply',
                    style: zillaSlab16W600()
                        .copyWith(color: AppColors.primaryGreenColor))
              ],
            ),
          )
        ],
      ),
    );
  }
}

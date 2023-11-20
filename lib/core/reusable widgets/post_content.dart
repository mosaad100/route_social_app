// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/functions/numbers_format.dart';

import 'package:social_media_app/core/utils/app_colors.dart';
import 'package:social_media_app/core/utils/images.dart';
import 'package:social_media_app/core/utils/text_styles.dart';
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/presentation/cubit/home_screen_cubit.dart';
import 'package:social_media_app/features/home_screen/presentation/widgets/expandble_text.dart';

class PostContent extends StatelessWidget {
  final PostDataEntity postDataEntity;
  final List<Function> functions;

  const PostContent({
    required this.functions,
    Key? key,
    required this.postDataEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundImage:
                        AssetImage(postDataEntity.userDataEntity.image ?? ''),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 240.w,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      postDataEntity.userDataEntity.name ?? '',
                      style: zillaSlab22W600(),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: ShowMoreTextWidget(
                text: postDataEntity.postDataEntity.body ?? '',
                style: zillaSlab20W500(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      HomeScreenCubit.get(context).like(postDataEntity);
                    },
                    child: postDataEntity.postDataEntity.like
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 40.h,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: AppColors.blackColor,
                            size: 40.h,
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      functions[0]();
                    },
                    child: Icon(
                      Icons.comment,
                      color: AppColors.blackColor,
                      size: 35.h,
                    ),
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.share,
                    color: AppColors.blackColor,
                    size: 35.h,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

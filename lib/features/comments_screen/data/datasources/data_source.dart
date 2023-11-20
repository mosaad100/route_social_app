import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/comments_screen/data/models/comment_model.dart';

abstract class GetCommentsDataSource {
  Future<Either<Failures, List<CommentModel>>> getCommentsData();
}

import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_entity.dart';

abstract class GetCommentsDomainRepo {
  Future<Either<Failures, List<CommentEntity>>> getComments();
}

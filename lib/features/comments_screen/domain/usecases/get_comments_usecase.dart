// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/comments_screen/domain/entities/comment_entity.dart';
import 'package:social_media_app/features/comments_screen/domain/repositories/get_comments_domain_repo.dart';

class GetCommentsUseCase {
  GetCommentsDomainRepo getCommentsDomainRepo;

  GetCommentsUseCase({
    required this.getCommentsDomainRepo,
  });

  Future<Either<Failures, List<CommentEntity>>> call() =>
      getCommentsDomainRepo.getComments();
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/comments_screen/data/datasources/data_source.dart';
import 'package:social_media_app/features/comments_screen/data/models/comment_model.dart';
import 'package:social_media_app/features/comments_screen/domain/repositories/get_comments_domain_repo.dart';

class GetCommentsDataRepo extends GetCommentsDomainRepo {
  GetCommentsDataSource getCommentsDataSource;

  GetCommentsDataRepo({
    required this.getCommentsDataSource,
  });

  @override
  Future<Either<Failures, List<CommentModel>>> getComments() =>
      getCommentsDataSource.getCommentsData();
}

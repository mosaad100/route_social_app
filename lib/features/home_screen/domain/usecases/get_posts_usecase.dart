// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';
import 'package:social_media_app/features/home_screen/domain/repositories/get_posts_domain_repo.dart';

class GetPostsUsecase {
  GetPostsDomainRepo getPostsDomainRepo;

  GetPostsUsecase({
    required this.getPostsDomainRepo,
  });

  Future<Either<Failures, List<PostDataEntity>>> call(int page) =>
      getPostsDomainRepo.getPosts(page);
}

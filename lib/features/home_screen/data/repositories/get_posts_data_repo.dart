// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/home_screen/data/datasources/data_source.dart';
import 'package:social_media_app/features/home_screen/data/models/post_data_model.dart';
import 'package:social_media_app/features/home_screen/domain/repositories/get_posts_domain_repo.dart';

class GetPostsDataRepo extends GetPostsDomainRepo {
  GetPostsDataSource getPostsDataSource;

  GetPostsDataRepo({
    required this.getPostsDataSource,
  });

  @override
  Future<Either<Failures, List<PostDataModel>>> getPosts(int page) =>
      getPostsDataSource.getPostsData(page);
}

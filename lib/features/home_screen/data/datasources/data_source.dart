import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/home_screen/data/models/post_data_model.dart';

abstract class GetPostsDataSource {
  Future<Either<Failures, List<PostDataModel>>> getPostsData(int page);
}

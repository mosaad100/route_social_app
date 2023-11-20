import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/home_screen/data/datasources/data_source.dart';
import 'package:social_media_app/features/home_screen/data/models/post_data_model.dart';

class Local extends GetPostsDataSource {
  @override
  Future<Either<Failures, List<PostDataModel>>> getPostsData(int page) {
    throw UnimplementedError();
  }
}

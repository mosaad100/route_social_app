import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/error/failures.dart';
import 'package:social_media_app/features/home_screen/domain/entities/post_data_entity.dart';

abstract class GetPostsDomainRepo {
  Future<Either<Failures, List<PostDataEntity>>> getPosts(int page);
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/posts_repository.dart';

class AddPostUseCase {
  final PostsRepository repository;
  AddPostUseCase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_architecture_posts/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;
  GetAllPostsUseCase({
    required this.repository,
  });
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}

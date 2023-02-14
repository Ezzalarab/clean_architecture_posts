import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/posts_repository.dart';

class DeletePostUseCase {
  final PostsRepository repository;
  DeletePostUseCase({
    required this.repository,
  });
  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.deletePost(id);
  }
}

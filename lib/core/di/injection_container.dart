import 'package:blogify_flutter_main/data/data_sources/mock_comments_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/mock_posts_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/mock_users_data_source_impl.dart';
import 'package:blogify_flutter_main/domain/data_sources/comments_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/posts_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/users_data_source.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependenciesContainer() async {
  serviceLocator.registerLazySingleton<UsersDataSource>(() => MockUsersDataSourceImpl()..init());
  serviceLocator
      .registerLazySingleton<CommentsDataSource>(() => MockCommentsDataSourceImpl()..init());

  final postsDataSource = MockPostsDataSourceImpl();
  await postsDataSource.init();

  serviceLocator.registerLazySingleton<PostsDataSource>(() => postsDataSource);
}

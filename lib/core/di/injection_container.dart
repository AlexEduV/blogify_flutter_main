import 'package:blogify_flutter_main/data/data_sources/local/image_picker_local_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/local/share_local_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/remote/mock_comments_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/remote/mock_posts_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/remote/mock_users_data_source_impl.dart';
import 'package:blogify_flutter_main/data/database/database_manager.dart';
import 'package:blogify_flutter_main/domain/data_sources/local/image_picker_local_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/local/share_local_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/remote/comments_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/remote/posts_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/data_sources/remote/users_data_source.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependenciesContainer() async {
  serviceLocator.registerLazySingleton<UsersDataSource>(() => MockUsersDataSourceImpl()..init());
  serviceLocator
      .registerLazySingleton<CommentsDataSource>(() => MockCommentsDataSourceImpl()..init());

  final postsDataSource = MockPostsDataSourceImpl();
  await postsDataSource.init();

  serviceLocator.registerLazySingleton<PostsDataSource>(() => postsDataSource);

  serviceLocator.registerLazySingleton<DatabaseManager>(() => DatabaseManager());

  serviceLocator.registerLazySingleton<ShareLocalDataSource>(() => ShareLocalDataSourceImpl());

  final imagePicker = ImagePicker();
  serviceLocator.registerLazySingleton<ImagePickerLocalDataSource>(
      () => ImagePickerLocalDataSourceImpl(imagePicker));
}

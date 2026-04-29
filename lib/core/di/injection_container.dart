import 'package:blogify_flutter_main/data/data_sources/local/image_picker_local_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/local/share_local_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/remote/mock_comments_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/remote/mock_posts_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/remote/mock_users_data_source_impl.dart';
import 'package:blogify_flutter_main/data/database/database_manager.dart';
import 'package:blogify_flutter_main/data/repositories/comments_repository_impl.dart';
import 'package:blogify_flutter_main/data/repositories/image_picker_repository_impl.dart';
import 'package:blogify_flutter_main/data/repositories/share_repository_impl.dart';
import 'package:blogify_flutter_main/data/repositories/users_repository_impl.dart';
import 'package:blogify_flutter_main/domain/data_sources/local/image_picker_local_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/local/share_local_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/remote/comments_data_source.dart';
import 'package:blogify_flutter_main/domain/data_sources/remote/posts_data_source.dart';
import 'package:blogify_flutter_main/domain/repositories/comments_repository.dart';
import 'package:blogify_flutter_main/domain/repositories/image_picker_repository.dart';
import 'package:blogify_flutter_main/domain/repositories/share_repository.dart';
import 'package:blogify_flutter_main/domain/repositories/users_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_all_comments_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_comments_by_post_id_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/init_comments_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/image_picker/pick_image_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/share/share_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/users/get_all_users_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/users/get_user_by_id_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/users/init_users_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/data_sources/remote/users_data_source.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependenciesContainer() async {
  serviceLocator.registerLazySingleton<UsersDataSource>(() => MockUsersDataSourceImpl()..init());
  serviceLocator
      .registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<InitUsersUseCase>(() => InitUsersUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton<GetAllUsersUseCase>(() => GetAllUsersUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton<GetUserByIdUseCase>(() => GetUserByIdUseCase(serviceLocator()));

  serviceLocator
      .registerLazySingleton<CommentsDataSource>(() => MockCommentsDataSourceImpl()..init());

  serviceLocator
      .registerLazySingleton<CommentsRepository>(() => CommentsRepositoryImpl(serviceLocator()));

  serviceLocator
      .registerLazySingleton<InitCommentsUseCase>(() => InitCommentsUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton<GetAllCommentsUseCase>(() => GetAllCommentsUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton<GetCommentsByPostIdUseCase>(
      () => GetCommentsByPostIdUseCase(serviceLocator()));

  final postsDataSource = MockPostsDataSourceImpl();
  await postsDataSource.init();

  serviceLocator.registerLazySingleton<PostsDataSource>(() => postsDataSource);

  serviceLocator.registerLazySingleton<DatabaseManager>(() => DatabaseManager());

  serviceLocator.registerLazySingleton<ShareLocalDataSource>(() => ShareLocalDataSourceImpl());
  serviceLocator
      .registerLazySingleton<ShareRepository>(() => ShareRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ShareUseCase>(() => ShareUseCase(serviceLocator()));

  final imagePicker = ImagePicker();
  serviceLocator.registerLazySingleton<ImagePickerLocalDataSource>(
      () => ImagePickerLocalDataSourceImpl(imagePicker));

  serviceLocator.registerLazySingleton<ImagePickerRepository>(
      () => ImagePickerRepositoryImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<PickImageUseCase>(() => PickImageUseCase(serviceLocator()));
}

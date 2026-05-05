import 'package:blogify_flutter_main/data/repositories/share_repository_impl.dart';
import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/data_sources/local/share_local_data_source_test.dart'; // Update with actual path

void main() {
  group('ShareRepositoryImpl', () {
    late MockShareLocalDataSource mockDataSource;
    late ShareRepositoryImpl repository;

    setUp(() {
      mockDataSource = MockShareLocalDataSource();
      repository = ShareRepositoryImpl(mockDataSource);
    });

    test('share delegates to local data source', () async {
      final params = ShareParamsModel(title: 'title', text: 'text');
      when(() => mockDataSource.share(params)).thenAnswer((_) async {});

      await repository.share(params);

      verify(() => mockDataSource.share(params)).called(1);
    });
  });
}

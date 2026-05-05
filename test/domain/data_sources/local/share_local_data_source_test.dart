import 'package:blogify_flutter_main/domain/data_sources/local/share_local_data_source.dart';
import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockShareLocalDataSource extends Mock implements ShareLocalDataSource {}

void main() {
  group('ShareLocalDataSource', () {
    late MockShareLocalDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockShareLocalDataSource();
    });

    test('share can be called with ShareParamsModel', () async {
      final params = ShareParamsModel(title: 'title', text: 'text');
      when(() => mockDataSource.share(params)).thenAnswer((_) async {});

      await mockDataSource.share(params);

      verify(() => mockDataSource.share(params)).called(1);
    });
  });
}

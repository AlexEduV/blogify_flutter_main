import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:blogify_flutter_main/domain/repositories/share_repository.dart'; // Update with actual path
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockShareRepository extends Mock implements ShareRepository {}

void main() {
  group('ShareRepository', () {
    late MockShareRepository mockRepository;

    setUp(() {
      mockRepository = MockShareRepository();
    });

    test('share can be called with ShareParamsModel', () async {
      final params = ShareParamsModel(title: 'title', text: 'text');
      when(() => mockRepository.share(params)).thenAnswer((_) async {});

      await mockRepository.share(params);

      verify(() => mockRepository.share(params)).called(1);
    });
  });
}

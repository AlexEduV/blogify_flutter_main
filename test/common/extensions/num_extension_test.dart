import 'package:blogify_flutter_main/common/extensions/num_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TurnExtension', () {
    test('converts degrees to turns correctly', () {
      expect(0.toTurns, 0.0);
      expect(90.toTurns, closeTo(0.25, 1e-10));
      expect(180.toTurns, closeTo(0.5, 1e-10));
      expect(360.toTurns, 1.0);
      expect(720.toTurns, 2.0);
      expect((-90).toTurns, closeTo(-0.25, 1e-10));
    });

    test('works with double values', () {
      expect(45.0.toTurns, closeTo(0.125, 1e-10));
      expect(22.5.toTurns, closeTo(0.0625, 1e-10));
    });
  });
}

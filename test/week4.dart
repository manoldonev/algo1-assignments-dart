import 'package:algo1_assignments_dart/week4/rselect.dart';
import 'package:test/test.dart';

void main() {
  group('rselect', () {
    test('basic', () {
      expect(rselect(<int>[4], 1), 4);
    });

    test('main', () {
      for (int orderStat in Iterable<int>.generate(10)) {
        expect(
            rselect(<int>[5, 2, 7, 1, 9, 6, 0, 8, 4, 3], orderStat), orderStat);
      }
    });
  });
}

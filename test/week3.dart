import 'package:algo1_assignments_dart/week3/quicksort.dart';
import 'package:test/test.dart';

void main() {
  group('quicksort', () {
    test('empty', () {
      expect(sort(<int>[]), <int>[]);
    });

    test('single', () {
      expect(sort(<int>[1]), <int>[1]);
    });

    test('single negative', () {
      expect(sort(<int>[-1]), <int>[-1]);
    });

    test('even', () {
      expect(sort(<int>[1, 2]), <int>[1, 2]);
    });

    test('even2', () {
      expect(sort(<int>[2, 1]), <int>[1, 2]);
    });

    test('mixed', () {
      expect(sort(<int>[2, -1]), <int>[-1, 2]);
    });

    test('mixed2', () {
      expect(sort(<int>[-1, 2]), <int>[-1, 2]);
    });

    test('odd', () {
      expect(sort(<int>[1, 2, 3]), <int>[1, 2, 3]);
    });

    test('odd1', () {
      expect(sort(<int>[1, 3, 2]), <int>[1, 2, 3]);
    });

    test('odd2', () {
      expect(sort(<int>[2, 1, 3]), <int>[1, 2, 3]);
    });

    test('odd3', () {
      expect(sort(<int>[3, 1, 2]), <int>[1, 2, 3]);
    });

    test('odd4', () {
      expect(sort(<int>[3, 2, 1]), <int>[1, 2, 3]);
    });

    test('odd5', () {
      expect(sort(<int>[2, 3, 1]), <int>[1, 2, 3]);
    });

    test('case 1', () {
      expect(sort(<int>[2, 1, 4, 3]), <int>[1, 2, 3, 4]);
    });

    test('case 2', () {
      expect(sort(<int>[1, 2, 4, 3]), <int>[1, 2, 3, 4]);
    });

    test('case 3', () {
      expect(sort(<int>[2, 1, 3, 4]), <int>[1, 2, 3, 4]);
    });
  });
}

import 'package:algo1_assignments_dart/week2/count_inversions.dart';
import 'package:algo1_assignments_dart/week2/mergesort.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

void main() {
  group('mergesort', () {
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

  group('count inversions', () {
    test('empty', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[]);
      expect(result.item2, 0);
    });

    test('single', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[1]);
      expect(result.item2, 0);
    });

    test('even', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[1, 2]);
      expect(result.item2, 0);
    });

    test('even2', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[2, 1]);
      expect(result.item2, 1);
    });

    test('odd', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[1, 2, 3]);
      expect(result.item2, 0);
    });

    test('odd1', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[1, 3, 2]);
      expect(result.item2, 1);
    });

    test('odd2', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[2, 1, 3]);
      expect(result.item2, 1);
    });

    test('odd3', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[3, 1, 2]);
      expect(result.item2, 2);
    });

    test('odd4', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[3, 2, 1]);
      expect(result.item2, 3);
    });

    test('odd5', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[2, 3, 1]);
      expect(result.item2, 2);
    });

    test('case 1', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[2, 4, 1, 3]);
      expect(result.item2, 3);
    });

    test('case 2', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[1, 2, 4, 3]);
      expect(result.item2, 1);
    });

    test('case 3', () {
      final Tuple2<List<int>, int> result = sortAndCount(<int>[4, 3, 2, 1]);
      expect(result.item2, 6);
    });
  });
}

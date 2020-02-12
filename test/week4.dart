import 'dart:math';

import 'package:algo1_assignments_dart/week4/mincut.dart';
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

  group('mincut', () {
    test('main', () {
      final Map<int, List<int>> graph = <int, List<int>>{
        1: <int>[2, 3, 4],
        2: <int>[1, 4, 5],
        3: <int>[1, 4],
        4: <int>[1, 2, 3, 5],
        5: <int>[2, 4]
      };

      final int n = graph.length;
      int trials = (n * n * log(n)).ceil();
      int result = n;
      int mincutCandidate;
      Map<int, List<int>> cut;
      while (trials > 0) {
        cut = mincut(graph);
        mincutCandidate = cut.values.toList()[0].length;
        if (mincutCandidate < result) {
          result = mincutCandidate;
        }

        trials -= 1;
      }

      expect(result, 2);
    });
  });
}

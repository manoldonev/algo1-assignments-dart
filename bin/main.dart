// import 'package:algo1_assignments_dart/week1/karatsuba.dart' as karatsuba;

// void main(List<String> arguments) {
//   final BigInt x = BigInt.tryParse(
//       '3141592653589793238462643383279502884197169399375105820974944592');
//   final BigInt y = BigInt.tryParse(
//       '2718281828459045235360287471352662497757247093699959574966967627');
//   print('${karatsuba.multiply(x, y)}!');
// }

// import 'dart:io';
// import 'package:algo1_assignments_dart/week2/count_inversions.dart';
// import 'package:tuple/tuple.dart';

// void main(List<String> arguments) async {
//   final List<String> lines =
//       await File('bin/week2_integer_array.txt').readAsLines();
//   final List<int> array = lines.map((String line) => int.parse(line)).toList();
//   final Tuple2<List<int>, int> result = sortAndCount(array);
//   print(result.item2);
// }

// import 'dart:io';
// import 'package:algo1_assignments_dart/week3/count_comparisons.dart';
// import 'package:tuple/tuple.dart';

// void main(List<String> arguments) async {
//   final List<String> lines =
//       await File('bin/week3_quicksort.txt').readAsLines();
//   final List<int> array = lines.map((String line) => int.parse(line)).toList();
//   final Tuple2<List<int>, int> result = sortAndCount(array);
//   print(result.item2);
// }

import 'dart:io';
import 'dart:math';
import 'package:algo1_assignments_dart/week4/mincut.dart';

void main(List<String> arguments) async {
  final List<String> lines =
      await File('bin/week4_kargerMinCut.txt').readAsLines();

  final Iterable<List<int>> tokenLists = lines.map<List<int>>((String line) =>
      line.trim().split('\t').map((String token) => int.parse(token)).toList());

  final Map<int, List<int>> graph = <int, List<int>>{};
  for (List<int> tokenList in tokenLists) {
    graph[tokenList[0]] = tokenList.sublist(1);
  }

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

  print(result);
}

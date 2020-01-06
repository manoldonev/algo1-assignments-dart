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

import 'dart:io';
import 'package:algo1_assignments_dart/week3/count_comparisons.dart';
import 'package:tuple/tuple.dart';

void main(List<String> arguments) async {
  final List<String> lines =
      await File('bin/week3_quicksort.txt').readAsLines();
  final List<int> array = lines.map((String line) => int.parse(line)).toList();
  final Tuple2<List<int>, int> result = sortAndCount(array);
  print(result.item2);
}

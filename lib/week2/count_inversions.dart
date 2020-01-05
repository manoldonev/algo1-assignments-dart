import 'package:tuple/tuple.dart';

Tuple2<List<int>, int> sortAndCount(List<int> array) {
  final int n = array.length;
  final int nBy2 = n ~/ 2;

  if (n <= 1) {
    return Tuple2<List<int>, int>(array, 0);
  }

  final Tuple2<List<int>, int> left = sortAndCount(array.sublist(0, nBy2));
  final Tuple2<List<int>, int> right = sortAndCount(array.sublist(nBy2));
  final Tuple2<List<int>, int> merged = _mergeAndCount(left.item1, right.item1);

  return Tuple2<List<int>, int>(
      merged.item1, left.item2 + right.item2 + merged.item2);
}

Tuple2<List<int>, int> _mergeAndCount(
    List<int> sortedLeft, List<int> sortedRight) {
  int i = 0;
  int j = 0;
  final int nLeft = sortedLeft.length;
  final int nRight = sortedRight.length;
  final List<int> merged = <int>[];
  int splitInversions = 0;

  while (i < nLeft && j < nRight) {
    if (sortedLeft[i] <= sortedRight[j]) {
      merged.add(sortedLeft[i]);
      i++;
    } else {
      merged.add(sortedRight[j]);
      j++;
      splitInversions += nLeft - i;
    }
  }

  if (i == nLeft) {
    merged.addAll(sortedRight.sublist(j));
  } else {
    merged.addAll(sortedLeft.sublist(i));
  }

  return Tuple2<List<int>, int>(merged, splitInversions);
}

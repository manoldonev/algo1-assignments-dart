import 'dart:math';
import 'package:tuple/tuple.dart';

Tuple2<List<int>, int> sortAndCount(List<int> array) {
  final int comparisons = _sortAndCount(array, 0, array.length - 1);

  return Tuple2<List<int>, int>(array, comparisons);
}

int _sortAndCount(List<int> array, int left, int right) {
  if (right <= left) {
    return 0;
  }

  final int pivotIndex = _partition(array, left, right);
  final int comparisonsLeft = _sortAndCount(array, left, pivotIndex - 1);
  final int comparisonsRight = _sortAndCount(array, pivotIndex + 1, right);

  return right - left + comparisonsLeft + comparisonsRight;
}

int _partition(List<int> array, int left, int right) {
  final int pivotIndex = _chooseMedianOfThreePivot(array, left, right);
  _swap(array, left, pivotIndex);

  final int pivot = array[left];
  int i = left + 1;

  for (int j = left + 1; j <= right; j++) {
    if (array[j] < pivot) {
      _swap(array, i, j);
      i++;
    }
  }

  _swap(array, left, i - 1);

  return i - 1;
}

void _swap(List<int> array, int i, int j) {
  final int temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}

// int _chooseRandomPivot(List<int> array, int left, int right) {
//   return left + Random().nextInt(right - left);
// }

// int _chooseFirstPivot(List<int> array, int left, int right) {
//   return left;
// }

// int _chooseLastPivot(List<int> array, int left, int right) {
//   return right;
// }

int _chooseMedianOfThreePivot(List<int> array, int left, int right) {
  final int middleIndex = left + (right - left) ~/ 2;

  return _findMedianOfThree(array, left, middleIndex, right);
}

int _findMedianOfThree(List<int> array, int first, int middle, int last) {
  final int a = array[first];
  final int b = array[middle];
  final int c = array[last];

  final int x = a - b;
  final int y = b - c;
  final int z = a - c;

  if (x * y > 0) {
    return middle;
  }

  if (x * z > 0) {
    return last;
  }

  return first;
}

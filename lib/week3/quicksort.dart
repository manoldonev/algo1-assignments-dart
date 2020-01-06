import 'dart:math';

List<int> sort(List<int> array) {
  _sort(array, 0, array.length - 1);

  return array;
}

void _sort(List<int> array, int left, int right) {
  if (right <= left) {
    return;
  }

  final int pivotIndex = _partition(array, left, right);
  _sort(array, left, pivotIndex - 1);
  _sort(array, pivotIndex + 1, right);
}

int _partition(List<int> array, int left, int right) {
  final int pivotIndex = _chooseRandomPivot(array, left, right);
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

int _chooseRandomPivot(List<int> array, int left, int right) {
  return left + Random().nextInt(right - left);
}

void _swap(List<int> array, int i, int j) {
  final int temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}

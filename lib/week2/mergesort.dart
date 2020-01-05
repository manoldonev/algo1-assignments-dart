List<int> sort(List<int> array) {
  final int n = array.length;
  final int nBy2 = n ~/ 2;

  if (n <= 1) {
    return array;
  }

  final List<int> sortedLeft = sort(array.sublist(0, nBy2));
  final List<int> sortedRight = sort(array.sublist(nBy2));

  return _merge(sortedLeft, sortedRight);
}

List<int> _merge(List<int> sortedLeft, List<int> sortedRight) {
  int i = 0;
  int j = 0;
  final int nLeft = sortedLeft.length;
  final int nRight = sortedRight.length;
  final List<int> merged = <int>[];

  while (i < nLeft && j < nRight) {
    if (sortedLeft[i] <= sortedRight[j]) {
      merged.add(sortedLeft[i]);
      i++;
    } else {
      merged.add(sortedRight[j]);
      j++;
    }
  }

  if (i == nLeft) {
    merged.addAll(sortedRight.sublist(j));
  } else {
    merged.addAll(sortedLeft.sublist(i));
  }

  return merged;
}

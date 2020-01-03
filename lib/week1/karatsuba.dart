import 'dart:math';

BigInt multiply(BigInt x, BigInt y) {
  /// x = 10^(n/2)*a + b, y = 10^(n/2)*c + d where a, b, c, d are n/2 digit numbers
  /// x*y = 10^(n)*a*c + 10^(n/2)*(a*d + b*c) + b*d
  /// 1. Compute recursively a*c
  /// 2. Compute recursively b*d
  /// 3. Compute recursively (a + b)*(c + d) = a*c + b*c + a*d +b*d
  /// 3) - 1) - 2) = a*d + b*c

  if (x < BigInt.zero || y < BigInt.zero) {
    throw ArgumentError('Negative integers not supported');
  }

  if (x < BigInt.from(10) || y < BigInt.from(10)) {
    return x * y;
  }

  final int n = max(_log10(x).toInt(), _log10(y).toInt()) + 1;
  final int nBy2 = n ~/ 2;
  final BigInt tenRaisedToNBy2 = BigInt.from(10).pow(nBy2);
  final BigInt a = x ~/ tenRaisedToNBy2;
  final BigInt b = x % tenRaisedToNBy2;
  final BigInt c = y ~/ tenRaisedToNBy2;
  final BigInt d = y % tenRaisedToNBy2;

  final BigInt ac = multiply(a, c);
  final BigInt bd = multiply(b, d);
  final BigInt adPlusBc = multiply(a + b, c + d) - ac - bd;

  return BigInt.from(10).pow(2 * nBy2) * ac + tenRaisedToNBy2 * adPlusBc + bd;
}

double _log10(BigInt x) {
  return log(x.toDouble()) / ln10;
}

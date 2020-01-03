import 'package:algo1_assignments_dart/week1/karatsuba.dart' as karatsuba;

void main(List<String> arguments) {
  final BigInt x = BigInt.tryParse(
      '3141592653589793238462643383279502884197169399375105820974944592');
  final BigInt y = BigInt.tryParse(
      '2718281828459045235360287471352662497757247093699959574966967627');
  print('Hello world: ${karatsuba.multiply(x, y)}!');
}

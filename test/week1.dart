import 'package:algo1_assignments_dart/week1/karatsuba.dart';
import 'package:test/test.dart';

void main() {
  group('karatsuba', () {
    test('multiply_1_2', () {
      expect(multiply(BigInt.from(1), BigInt.from(2)), BigInt.two);
    });

    test('multiply_12_34', () {
      expect(multiply(BigInt.from(12), BigInt.from(34)), BigInt.from(408));
    });

    test('multiply_123_456', () {
      expect(multiply(BigInt.from(123), BigInt.from(456)), BigInt.from(56088));
    });

    test('multiply_1234_5678', () {
      expect(
          multiply(BigInt.from(1234), BigInt.from(5678)), BigInt.from(7006652));
    });

    test('multiply_big_integers', () {
      expect(
          multiply(
              BigInt.tryParse(
                  '3141592653589793238462643383279502884197169399375105820974944592'),
              BigInt.tryParse(
                  '2718281828459045235360287471352662497757247093699959574966967627')),
          BigInt.tryParse(
              '8539734222673567065463550869546574495034888535765114961879601127067743044893204848617875072216249073013374895871952806582723184'));
    });
  });
}

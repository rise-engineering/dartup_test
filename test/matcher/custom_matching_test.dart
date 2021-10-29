import 'package:dartup_test/dartup_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'matcher',
    () {
      // tests
      test(
        'should be create inline custom matcher',
        () async {
          // arrange
          final b = true;
          expect(b, matcher('is not false', (item, _) => item != false));
          expect(b,
              isNot(matcher('is to be a string', (item, _) => item is String)));
        },
      );
    },
  );

  group(
    'and',
    () {
      // tests
      test(
        'should compose matcher',
        () async {
          // arrange
          final n = 2;
          expect(n, lessThan(10).and(greaterThan(1)));
          expect(n, isNot(lessThan(67).and(greaterThan(1).and(equals(3)))));
        },
      );
    },
  );

  group(
    'not',
    () {
      // tests
      test(
        'should work with infix',
        () async {
          // arrange
          final b = 3;
          expect(b, lessThan(2).not());
        },
      );
    },
  );
}

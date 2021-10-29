import 'package:dartup_test/dartup_testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'isLongerThan',
    () {
      // tests
      test(
        'should match one duration',
        () async {
          // arrange
          final tenDays = Duration(days: 10);
          final hundredMilli = Duration(milliseconds: 100);
          // act
          // assert
          expect(tenDays, isLongerThan(hours: 5));
          expect(hundredMilli, isNot(isLongerThan(hours: 5)));
        },
      );

      test(
        'should throw an error if actual is not duration',
        () async {
          // arrange
          expect(() => isLongerThan().matches(1, {}), throwsAssertionError);
        },
      );
    },
  );

  group(
    'isShorterThan',
    () {
      // tests
      test(
        'should match one duration',
        () async {
          // arrange
          final tenDays = Duration(days: 10);
          final hundredMilli = Duration(milliseconds: 100);
          // act
          // assert
          expect(hundredMilli, isShorterThan(hours: 5));
          expect(tenDays, isNot(isShorterThan(hours: 5)));
        },
      );

      test(
        'should throw an error if actual is not duration',
        () async {
          // arrange
          expect(() => isShorterThan().matches(1, {}), throwsAssertionError);
        },
      );
    },
  );

  group(
    'isAfter',
    () {
      // tests
      test(
        'should match one dateTime',
        () async {
          // arrange
          final now = DateTime.now();
          final beforeNow = now.subtract(Duration(days: 10));
          // act
          // assert
          expect(now, isAfter(beforeNow));
          expect(beforeNow, isNot(isAfter(now)));
        },
      );
    },
  );

  group(
    'isBefore',
    () {
      // tests
      test(
        'should match one dateTime',
        () async {
          // arrange
          final now = DateTime.now();
          final beforeNow = now.subtract(Duration(days: 10));
          // act
          // assert
          expect(beforeNow, isBefore(now));
          expect(now, isNot(isBefore(beforeNow)));
        },
      );
    },
  );

  group(
    'isCloseTo',
    () {
      // tests
      test(
        'should match one dateTime',
        () async {
          // arrange
          final now = DateTime.now();
          final beforeNow = now.subtract(Duration(days: 10));
          // act
          // assert
          expect(now, isCloseTo(beforeNow, days: 10));
          expect(now, isCloseTo(beforeNow, days: 12));
          expect(beforeNow, isCloseTo(now, days: 10));
          expect(beforeNow, isCloseTo(now, days: 12));
          expect(now, isNot(isCloseTo(beforeNow)));
        },
      );
      test(
        'should match one dateTime with wait',
        () async {
          // arrange
          final beforeNow = DateTime.now();
          await Future.delayed(Duration(milliseconds: 500));
          final now = DateTime.now();
          // act
          // assert
          expect(now, isCloseTo(beforeNow, milliseconds: 600));
          expect(now, isNot(isCloseTo(beforeNow, milliseconds: 400)));
        },
      );
    },
  );
}

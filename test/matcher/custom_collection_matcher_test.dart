import 'package:dartup_test/dartup_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'containsSomeOf',
    () {
      // tests
      test(
        'should match on a expected sub-list',
        () async {
          // arrange
          final nums = {1, 2, 3}.map((e) => e * 2);
          // act
          // assert
          expect(nums, containsSomeOf([4, 2]));
        },
      );

      test(
        'should throw an error if actual is not iterable',
        () async {
          // arrange
          expect(() => containsSomeOf([]).matches(1, {}), throwsAssertionError);
        },
      );

      test(
        'should throw an error if actual is empty',
        () async {
          // arrange
          expect(
              () => containsSomeOf([]).matches([], {}), throwsAssertionError);
        },
      );

      test(
        'should succeed if expected values contains duplicate of actual',
        () async {
          // arrange
          // arrange
          final nums = {1, 2, 3}.map((e) => e * 2);
          // act
          // assert
          expect(nums, containsSomeOf([4, 2, 4, 2]));
        },
      );
      test(
        'should does match if expected values different from actual',
        () async {
          // arrange
          // arrange
          final nums = {1, 2, 3}.map((e) => e * 2);
          // act
          // assert
          expect(nums, isNot(containsSomeOf([1000])));
        },
      );
    },
  );
}

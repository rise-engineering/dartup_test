import 'package:dartup_test/dartup_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'isEmptyStream',
    () {
      // tests
      test(
        'should match stream',
        () async {
          // arrange
          // act
          // assert
          await expectLater(Stream.empty(), isEmptyStream);
          await expectLater( isEmptyStream.matching(Stream.value(1)), completion(isFalse));
          await expectLater(Stream.empty(), emitsNothing);
          await expectLater(emitsNothing.matching(Stream.value(1)), completion(isFalse));
        },
      );
    },
  );

  group(
    'isNotEmptyStream',
    () {
      // tests
      test(
        'should match stream',
        () async {
          // arrange
          // act
          // assert
          // final string =
          //     await isNotEmptyStream.matchQueue(StreamQueue(Stream.empty()));
          await expectLater(Stream.value(1), isNotEmptyStream);
          await expectLater(isNotEmptyStream.matching(Stream.empty()), completion(isFalse));
        },
      );
    },
  );

  group(
    'hasCountOf',
        () {
      // tests
      test(
        'should match stream',
            () async {
          // arrange
          // act
          // assert
          // final string =
          //     await isNotEmptyStream.matchQueue(StreamQueue(Stream.empty()));
          await expectLater(Stream.fromIterable([1,2,3,4]), countOf(4));
          await expectLater(countOf(1).matching(Stream.empty()), completion(isFalse));
          await expectLater(countOf(2).matching(Stream.fromIterable([1,2,3])), completion(isFalse));
        },
      );
    },
  );
}

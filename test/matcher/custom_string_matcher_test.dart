import 'package:dartup_test/dartup_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'email',
    () {
      // tests
      test(
        'is an email',
        () async {
          // arrange
          final tEmail = 'a&d@somedomain.com';
          // assert
          expect(tEmail, isEmail);
        },
      );
      test(
        'is not an email',
        () async {
          // arrange
          final tEmail = '.abc@somedomain.com';
          // assert
          expect(tEmail, isNot(isEmail));
        },
      );

      test(
        'should throw an error if actual is not a String',
        () async {
          // arrange
          expect(() => isEmail.matches(1, {}), throwsAssertionError);
        },
      );
    },
  );

  group(
    'url',
    () {
      // tests
      test(
        'should be a url',
        () async {
          // arrange
          final tUrl = 'http://www.google.com/search?q=good+url+regex';
          // assert
          expect(tUrl, isUrl);
        },
      ); // tests
      test(
        'is not an url',
        () async {
          // arrange
          final tUrl = 'htp://google.co';
          // assert
          expect(tUrl, isNot(isUrl));
        },
      );
      test(
        'should throw an error if actual is not a String',
        () async {
          // arrange
          expect(() => isUrl.matches(1, {}), throwsAssertionError);
        },
      );
    },
  );
}

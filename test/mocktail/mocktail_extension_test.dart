import 'package:dartup_test/dartup_testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../shared_classes.dart';

class MockColorClient extends Mock implements ColorClient {}

void main() {
  late MockColorClient mockColorClient;
  late ColorService colorService;
  // before each tests
  setUp(() async {
    mockColorClient = MockColorClient();
    colorService = ColorService(mockColorClient);
  });
  group(
    'expectCapturedToBe',
    () {
      // tests
      test(
        'should give a selection by name',
        () async {
          // arrange
          when(() => mockColorClient.findByName(any()))
              .thenAnswer((_) => Color('fakeCode', 'fakeName'));
          // act
          var result = colorService.selectColorByName('fakeCode');
          // assert
          expect(result, matches('.*fakeName.*fakeCode'));
          verify(() => mockColorClient.findByName(captureAny()))
              .and
              .expectCapturedToBe(['fakeCode']);
        },
      );
    },
  );
}

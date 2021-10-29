# dartup_test

dartup_test provides few test extensions to write tests in Flutter.

## Test extensions for matcher
```dart
      test(
        'should be create inline custom matcher',
        () {
          // arrange
          final b = true;
          expect(b, matcher('is not false', (item, _) => item != false));
          expect(b,
              isNot(matcher('is to be a string', (item, _) => item is String)));
        },
      );

      test(
        'should compose matcher',
        () {
          // arrange
          final n = 2;
          expect(n, lessThan(10).and(greaterThan(1)));
          expect(n, isNot(lessThan(67).and(greaterThan(1).and(equals(3)))));
        },
      );
```

## Test extensions for collections
### containsSomeOf
```dart
      test(
        'should match on a expected sub-list',
            () {
          // arrange
          final nums = {1, 2, 3}.map((e) => e * 2);
          // act
          // assert
          expect(nums, containsSomeOf([4, 2]));
        },
      );

      test(
        'should does match if expected values different from actual',
            () {
          // arrange
          // arrange
          final nums = {1, 2, 3}.map((e) => e * 2);
          // act
          // assert
          expect(nums, isNot(containsSomeOf([1000])));
        },
      );

```


## Test extensions for stream
### emitsNothing
```dart
      test(
        'should match stream',
        () async {
          await expectLater(Stream.empty(), emitsNothing);
        },
      );

```
### isEmptyStream
```dart
      test(
        'should match stream',
        () async {
          // arrange
          // act
          // assert
          await expectLater(Stream.empty(), isEmptyStream);
        },
      );
```
### isNotEmptyStream
```dart
      test(
        'should match stream',
        () async {
          await expectLater(Stream.value(1), isNotEmptyStream);
        },
      )

```
### countOf
```dart
      test(
        'should match stream',
            () async {
          await expectLater(Stream.fromIterable([1,2,3,4]), countOf(4));
        },
      );
```
see also `emitsErrorOfType`, `matching`.


## Test extensions for string
### isEmail
```dart
      test(
        'is an email',
        () async {
          // arrange
          final tEmail = 'a&d@somedomain.com';
          // assert
          expect(tEmail, isEmail);
        },
      );
```
### urlRegex
```dart
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
```
## Test extensions for Duration
### isLongerThan
```dart
      test(
        'should match one duration',
        () async {
          // arrange
          final tenDays = Duration(days: 10);
          final hundredMilli = Duration(milliseconds: 100);
          expect(tenDays, isLongerThan(hours: 5));
          expect(hundredMilli, isNot(isLongerThan(hours: 5)));
        },
      );
```
### isShorterThan
```dart
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

```
### isAfter
```dart
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
```
### isBefore
```dart
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
```
### isCloseTo
```dart
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
```

## Mocktail extension

### and & expectCapturedToBe
```dart
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
```

## TestWidgets
### pumpWidgetWithApp
```dart
      testWidgets('Should execute on pressed', (WidgetTester tester) async {
        var a = 0;
        final button = ElevatedButton(
          onPressed: () => a = a + 1,
          child: Text(
            'ok',
          ),
        );
        //arrange
        await tester.pumpWidgetWithApp(button);
        //act
        final foundButton = find.byType(ElevatedButton);
        expect(foundButton, findsOneWidget);
        await tester.tap(foundButton);
        await tester.pump();
        //assert
        expect(a, 1);
      });
```


import 'package:dartup_test/dartup_testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Button',
    () {
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
    },
  );
}

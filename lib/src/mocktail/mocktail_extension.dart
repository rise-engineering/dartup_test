import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

extension VerificationExtension on VerificationResult {
  VerificationResult get and => this;

  void expectCapturedToBe(List<dynamic> elements) {
    expect(captured, elements);
  }
}

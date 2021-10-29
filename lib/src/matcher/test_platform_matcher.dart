part of 'matcher.dart';

/// Returns a matcher that matches a callback or Future that throws a
/// [TestFailure] with the given [message].
///
/// [message] can be a string or a [Matcher].
Matcher throwsTestFailure(message) => throwsA(isTestFailure(message));

/// Returns a matcher that matches a [TestFailure] with the given [message].
///
/// [message] can be a string or a [Matcher].
Matcher isTestFailure(message) => const TypeMatcher<TestFailure>()
    .having((e) => e.message, 'message', message);

// fixme:[IJP 13/02/2021 09:26]: upy failure
// /// [message] can be a string or a [Matcher].
// Matcher isFailureException(message) =>
//     const TypeMatcher<ApplicationException>()
//         .having((e) => e.message, 'message', message);

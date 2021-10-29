part of 'matcher.dart';

typedef MatcherFunction = bool Function(dynamic a, Map b);

/// [CustomMatcher] that can make assertions about prices with:
class CustomMatching extends Matcher {
  CustomMatching._(this.description, this.matchFunct);

  final String description;
  final MatcherFunction matchFunct;

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) => matchFunct(item, matchState);

  @override
  Description describe(Description description) =>
      description.add(this.description);
}

CustomMatching matcher(String description, MatcherFunction matches) {
  return CustomMatching._(description, matches);
}

extension MatcherExtension on Matcher {
  Matcher not() {
    return isNot(this);
  }

  Matcher and(Matcher input) {
    return allOf(this, input);
  }
}

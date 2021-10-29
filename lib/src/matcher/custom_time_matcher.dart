part of 'matcher.dart';

Matcher isAfter(DateTime expectedDateTime) {
  return matcher('to be after <$expectedDateTime>', (item, _) {
    assert(item is DateTime);
    return (item as DateTime).isAfter(expectedDateTime);
  });
}

Matcher isBefore(DateTime expectedDateTime) {
  return matcher('to be before <$expectedDateTime>', (item, _) {
    assert(item is DateTime);
    return (item as DateTime).isBefore(expectedDateTime);
  });
}

Matcher isAtSameMomentAs(DateTime expectedDateTime) {
  return matcher('to be at same moment as <$expectedDateTime>', (item, _) {
    assert(item is DateTime);
    return (item as DateTime).isAtSameMomentAs(expectedDateTime);
  });
}

Matcher isCloseTo(DateTime expectedDateTime,
    {int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0}) {
  final closeDuration = Duration(
          days: days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          milliseconds: milliseconds,
          microseconds: microseconds)
      .abs();
  return _IsDateTimeCloseTo(
    expectedDateTime,
    closeDuration,
  );
}

class _IsDateTimeCloseTo extends Matcher {
  final DateTime _expected;
  final Duration _closeDuration;

  const _IsDateTimeCloseTo(this._expected, this._closeDuration);

  @override
  bool matches(item, Map matchState) {
    assert(item is DateTime);
    final duration = (item as DateTime).difference(_expected).abs();
    return duration.compareTo(_closeDuration) <= 0;
  }

  @override
  Description describe(Description description) {
    return description
        .add('to be is close to ')
        .addDescriptionOf(_expected)
        .add('with in ')
        .addDescriptionOf(_closeDuration);
  }

  @override
  Description describeMismatch(
      item, Description mismatchDescription, Map matchState, bool verbose) {
    return mismatchDescription
        .add('but was ')
        .addDescriptionOf((item as DateTime).difference(_expected).abs());
  }
}

Matcher isLongerThan(
    {int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0}) {
  final expected = Duration(
          days: days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          milliseconds: milliseconds,
          microseconds: microseconds)
      .abs();
  return matcher('to be longer than <$expected', (item, _) {
    assert(item is Duration);
    return (item as Duration).compareTo(expected) >= 0;
  });
}

Matcher isShorterThan(
    {int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0}) {
  final expected = Duration(
          days: days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          milliseconds: milliseconds,
          microseconds: microseconds)
      .abs();
  return matcher('to be shorter than <$expected>', (item, _) {
    assert(item is Duration);
    return (item as Duration).compareTo(expected) <= 0;
  });
}

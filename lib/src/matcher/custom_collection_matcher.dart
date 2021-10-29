part of 'matcher.dart';

Matcher containsKey(key) => _ContainsKey(key);

class _ContainsKey extends Matcher {
  final Object _key;

  const _ContainsKey(this._key);

  @override
  bool matches(dynamic item, Map<dynamic,dynamic> matchState) {
    assert(item is Map);
    return (item as Map).containsKey(_key);
  }

  @override
  Description describe(Description description) =>
      description.add('contains key ').addDescriptionOf(_key);
}

Matcher containsSomeOf(Iterable expected) => _ContainsSome(expected);

class _ContainsSome extends Matcher {
  final Iterable _expected;

  const _ContainsSome(this._expected);

  @override
  bool matches(item, Map matchState) {
    assert(item is Iterable);
    final actual = item as Iterable;
    assert(actual.isNotEmpty);

    return _expected
        .map((a) => actual.contains(a))
        .reduce((value, element) => value && element);
  }

  @override
  Description describe(Description description) {
    return description.add('to contain some of ').addDescriptionOf(_expected);
  }

  @override
  Description describeMismatch(
      item, Description mismatchDescription, Map matchState, bool verbose) {
    assert(item is Iterable);
    final actual = item as Iterable;
    _expected
        .map((a) => actual.contains(a)) //
        .toList() //
        .asMap() //
        .map((k, v) {
      mismatchDescription.pushDescription(_expected, k, v);
      return MapEntry(k, v);
    });
    return mismatchDescription;
  }
}

extension _DescriptionMismatch on Description {
  void pushDescription(Iterable expected, int index, bool match) {
    if (!match) {
      add('no match found for ');
      addDescriptionOf(expected.elementAt(index));
      add(' in the expected values at the index ');
      addDescriptionOf(index);
    }
  }
}

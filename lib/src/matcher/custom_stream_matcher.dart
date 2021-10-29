part of 'matcher.dart';

final StreamMatcher emitsNothing = StreamMatcher(
    (queue) async => (await queue.hasNext) ? '' : null, 'emit none');
final StreamMatcher isEmptyStream = StreamMatcher(
    (queue) async => (await queue.hasNext) ? '' : null, 'be empty');

final StreamMatcher isNotEmptyStream = StreamMatcher(
    (queue) async => (!await queue.hasNext) ? '' : null, 'be not empty');

StreamMatcher countOf(int expectedCount) {
  return StreamMatcher((queue) async {
    var eventsCount = 0;
    await queue.withTransaction((copy) async {
      while (await copy.hasNext) {
        eventsCount++;
        try {
          await copy.next;
        } catch (_) {
          // Ignore errors events.
        }
      }
      return false;
    });

    if (eventsCount != expectedCount) {
      return 'Emitted <$eventsCount> events';
    }
    return null;
  }, 'have <$expectedCount> event');
}

extension StreamMatcherTestExtension on StreamMatcher {
  Future<bool> matching<T>(Stream<T> stream) async {
    return matchQueue(StreamQueue<T>(stream)) //
        .then((s) => s == null);
  }
}

StreamMatcher emitsErrorOfType<E>() {
  return emitsError(isA<E>());
}

part of 'matcher.dart';

Matcher hasThrow<E>(){
  return throwsA(TypeMatcher<E>());
}


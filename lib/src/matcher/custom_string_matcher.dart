part of 'matcher.dart';

///
/// RFC 2821, 2822 Compliant
/// from https://regexlib.com
///
final RegExp emailRegex = RegExp(
    r"^((([!#$%&'*+\-/=?^_`{|}~\w])|([!#$%&'*+\-/=?^_`{|}~\w][!#$%&'*+\-/=?^_`{|}~\.\w]{0,}[!#$%&'*+\-/=?^_`{|}~\w]))[@]\w+([-.]\w+)*\.\w+([-.]\w+)*)$");

class IsEmail extends CustomMatcher {
  IsEmail._() : super('email is', 'email', matches(emailRegex));

  @override
  dynamic featureValueOf(actual) => actual;
}

final isEmail =
    matcher('to be a email', (item, _) {
      assert(item is String);
      return emailRegex.hasMatch(item);
    });

final urlRegex = RegExp(
    r"(https:[/][/]|http:[/][/]|www.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*$");

final isUrl = matcher('to be an url', (item, _) {
  assert(item is String);
  return urlRegex.hasMatch(item);
});

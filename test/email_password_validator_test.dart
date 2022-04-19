import 'package:flutter_test/flutter_test.dart';
import 'package:news_paper/domain/service/validator.dart';

void main() {
  test('Empty Email Test', () {
    var result = Validator.validateEmail('');
    expect(result, 'false');
  });
  test('Invalid Email Test', () {
    var result = Validator.validateEmail('');
    expect(result, 'false');
  });

  test('Valid Email Test', () {
    var result = Validator.validateEmail('ajay.kumar@nonstopio.com');
    expect(result, 'true');
  });

  test('Empty Password Test', () {
    var result = Validator.validatePassword('');
    expect(result, 'false');
  });

  test('Invalid Password Test', () {
    var result = Validator.validatePassword('123');
    expect(result, 'false');
  });

  test('Valid Password Test', () {
    var result = Validator.validatePassword('ajay12345');
    expect(result, 'true');
  });
}
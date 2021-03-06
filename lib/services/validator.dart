import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

final usernameValidator = MultiValidator([
  RequiredValidator(errorText: 'username is required'),
  MinLengthValidator(6,
      errorText: 'username must be at least 6 character long'),
  PatternValidator(r'(?=.*?[0-9])',
      errorText: 'username must have atleast one number'),
]);

final emailValidator = MultiValidator([
  EmailValidator(errorText: 'enter a valid email address'),
  RequiredValidator(errorText: 'email is required'),
]);

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Field required'),
]);

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8,
        errorText: 'password must be at least 8 character long'),
    PatternValidator(r'(?=.?[#?!@$%^&-])',
        errorText: 'passwords must have at least one special character'),
  ],
);

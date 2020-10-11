import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_todos/domain/core/failures.dart';
import 'package:flutter_ddd_todos/domain/core/value_objects.dart';
import 'package:flutter_ddd_todos/domain/core/value_validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String value) {
    assert(value != null);
    return EmailAddress._(
      value: validateEmailAddress(value),
    );
  }

  const EmailAddress._({
    @required this.value,
  });
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String value) {
    assert(value != null);
    return Password._(
      value: validatePassword(value),
    );
  }

  const Password._({
    @required this.value,
  });
}

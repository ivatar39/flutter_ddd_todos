import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_todos/domain/core/failures.dart';
import 'package:flutter_ddd_todos/domain/core/value_objects.dart';
import 'package:flutter_ddd_todos/domain/core/value_validators.dart';
import 'package:uuid/uuid.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String value) {
    return EmailAddress._(
      value: validateEmailAddress(value),
    );
  }

  const EmailAddress._({
    required this.value,
  });
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String value) {
    return Password._(
      value: validatePassword(value),
    );
  }

  const Password._({
    required this.value,
  });
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }
  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(right(uniqueId));
  }
  const UniqueId._(this.value);
}

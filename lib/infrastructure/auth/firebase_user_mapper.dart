import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ddd_todos/domain/auth/user.dart' as user;
import 'package:flutter_ddd_todos/domain/auth/value_objects.dart';

extension FirebaseUserDomainX on User {
  user.User toDomain() {
    return user.User(id: UniqueId.fromUniqueString(uid));
  }
}

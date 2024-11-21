import 'package:sentinal/app/errors/failure.dart';

sealed class DatabaseFailure extends Failure {
  DatabaseFailure(super.message);
}

class DatabaseInvalidDataFailure extends DatabaseFailure {
  DatabaseInvalidDataFailure(super.message);
}

class UnknownDatabaseFailure extends DatabaseFailure {
  UnknownDatabaseFailure(super.message);
}

import 'package:injectable/injectable.dart';
import 'package:sentinal/app/database/app_database.dart';

@module
abstract class DatabaseModule {
  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();
}

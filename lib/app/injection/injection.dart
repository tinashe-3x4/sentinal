import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sentinal/app/injection/injection.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();

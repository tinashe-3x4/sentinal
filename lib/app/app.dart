import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentinal/app/injection/injection.dart';
import 'package:sentinal/app/router/router.dart';
import 'package:sentinal/app/theme/sentinal_theme.dart';
import 'package:sentinal/app/widgets/sentinal_loader.dart';
import 'package:sentinal/features/banned_countries/presentation/bloc/banned_countries_bloc.dart';
import 'package:sentinal/features/cards/presentation/bloc/bloc/cards_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: SentinalTheme.lightTheme,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => locator<CardsBloc>(),
            ),
            BlocProvider(
              create: (context) => locator<BannedCountriesBloc>(),
            ),
          ],
          child: child ?? const SentinalLoader(),
        );
      },
    );
  }
}

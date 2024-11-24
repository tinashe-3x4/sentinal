import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentinal/app/injection/injection.dart';
import 'package:sentinal/app/router/router.dart';
import 'package:sentinal/app/theme/sentinal_theme.dart';
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
        return BlocProvider(
          create: (context) => locator<CardsBloc>(),
          child: child,
        );
      },
    );
  }
}

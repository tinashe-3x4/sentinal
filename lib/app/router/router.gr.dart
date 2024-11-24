// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:sentinal/app/widgets/sentinal_scaffold.dart' as _i2;
import 'package:sentinal/features/cards/presentation/screens/cards_screen.dart'
    as _i1;

/// generated route for
/// [_i1.SavedCardsScreen]
class SavedCardsRoute extends _i3.PageRouteInfo<void> {
  const SavedCardsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SavedCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedCardsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.SavedCardsScreen();
    },
  );
}

/// generated route for
/// [_i2.SentinalScaffold]
class SentinalScaffold extends _i3.PageRouteInfo<void> {
  const SentinalScaffold({List<_i3.PageRouteInfo>? children})
      : super(
          SentinalScaffold.name,
          initialChildren: children,
        );

  static const String name = 'SentinalScaffold';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SentinalScaffold();
    },
  );
}

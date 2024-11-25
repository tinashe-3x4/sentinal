// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:sentinal/app/widgets/sentinal_scaffold.dart' as _i3;
import 'package:sentinal/features/banned_countries/presentation/screens/banned_countries_screen.dart'
    as _i1;
import 'package:sentinal/features/cards/presentation/screens/cards_screen.dart'
    as _i2;

/// generated route for
/// [_i1.BannedCountries]
class BannedCountries extends _i4.PageRouteInfo<void> {
  const BannedCountries({List<_i4.PageRouteInfo>? children})
      : super(
          BannedCountries.name,
          initialChildren: children,
        );

  static const String name = 'BannedCountries';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.BannedCountries();
    },
  );
}

/// generated route for
/// [_i2.SavedCardsScreen]
class SavedCardsRoute extends _i4.PageRouteInfo<void> {
  const SavedCardsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SavedCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedCardsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SavedCardsScreen();
    },
  );
}

/// generated route for
/// [_i3.SentinalScaffold]
class SentinalScaffold extends _i4.PageRouteInfo<void> {
  const SentinalScaffold({List<_i4.PageRouteInfo>? children})
      : super(
          SentinalScaffold.name,
          initialChildren: children,
        );

  static const String name = 'SentinalScaffold';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SentinalScaffold();
    },
  );
}

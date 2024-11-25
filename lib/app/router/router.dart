import 'package:auto_route/auto_route.dart';
import 'package:sentinal/app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SentinalScaffold.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(
              page: SavedCardsRoute.page,
              path: 'cards',
            ),
            AutoRoute(
              page: BannedCountries.page,
              path: 'banned-countries',
            ),
          ],
        ),
      ];
}

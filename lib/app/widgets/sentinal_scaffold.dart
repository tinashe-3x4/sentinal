import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:sentinal/app/router/router.gr.dart';
import 'package:sentinal/app/theme/sentinal_theme.dart';

@RoutePage()
class SentinalScaffold extends StatefulWidget {
  const SentinalScaffold({super.key});

  @override
  State<SentinalScaffold> createState() => _SentinalScaffoldState();
}

class _SentinalScaffoldState extends State<SentinalScaffold> {
  final _navigationItems = [
    (
      icon: const LineIcon.home(),
      label: 'Dashboard',
    ),
    (
      icon: const LineIcon.flag(),
      label: 'Countries',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        SavedCardsRoute(),
        BannedCountries(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final width = MediaQuery.of(context).size.width;
        final isLargeScreen = width > 600;

        return Scaffold(
          body: Row(
            children: [
              if (isLargeScreen)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 90,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        SentinalTheme.navigationRailGradientStart,
                        SentinalTheme.navigationRailGradientEnd,
                      ],
                    ),
                  ),
                  child: NavigationRail(
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: tabsRouter.setActiveIndex,
                    labelType: NavigationRailLabelType.selected,
                    useIndicator: true,
                    indicatorColor: Colors.white.withOpacity(0.2),
                    backgroundColor: Colors.transparent,
                    destinations: _navigationItems
                        .map(
                          (item) => NavigationRailDestination(
                            icon: item.icon,
                            selectedIcon: IconTheme(
                              data: const IconThemeData(
                                color: Colors.white,
                                size: 24,
                              ),
                              child: item.icon,
                            ),
                            label: Text(
                              item.label,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              Expanded(
                child: SafeArea(child: child),
              ),
            ],
          ),
          bottomNavigationBar: !isLargeScreen
              ? AdvancedSalomonBottomBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: _navigationItems
                      .map(
                        (item) => AdvancedSalomonBottomBarItem(
                          icon: item.icon,
                          title: Text(item.label),
                          selectedColor: SentinalTheme.primaryBlue,
                        ),
                      )
                      .toList(),
                )
              : null,
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [ExploreShellRoute(), FavoritesRoute(), HistoryRoute()],
      builder: (context, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((
                states,
              ) {
                bool selected = states.contains(WidgetState.selected);
                return GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: selected
                      ? Colors.white
                      : const Color.fromRGBO(136, 132, 129, 1),
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: context.tabsRouter.activeIndex,
              onDestinationSelected: context.tabsRouter.setActiveIndex,
              destinations: [
                NavigationDestination(
                  icon: SvgPicture.asset(
                    'assets/icons/chef_hat.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(136, 132, 129, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  selectedIcon: SvgPicture.asset(
                    'assets/icons/chef_hat.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Explore',
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    'assets/icons/heart_outline.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(136, 132, 129, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  selectedIcon: SvgPicture.asset(
                    'assets/icons/heart_outline.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Favorites',
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    'assets/icons/analytics.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(136, 132, 129, 1),
                      BlendMode.srcIn,
                    ),
                  ),
                  selectedIcon: SvgPicture.asset(
                    'assets/icons/analytics.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'History',
                ),
              ],
              backgroundColor: const Color.fromRGBO(24, 27, 33, 1),
              indicatorColor: const Color.fromRGBO(219, 122, 43, 1),
            ),
          ),
        );
      },
    );
  }
}

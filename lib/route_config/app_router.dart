import 'package:auto_route/auto_route.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardRoute.page, initial: true),
    AutoRoute(
      page: NavigationBarRoute.page,
      children: [
        AutoRoute(
          page: ExploreShellRoute.page,
          initial: true,
          children: exploreShellChildren,
        ),
        AutoRoute(page: FavoritesRoute.page),
        AutoRoute(page: HistoryRoute.page),
      ],
    ),
  ];

  List<AutoRoute> get exploreShellChildren => [
    AutoRoute(page: ExploreRoute.page, initial: true),
    AutoRoute(page: RecipeDetailsRoute.page),
    AutoRoute(page: RecipeChallengeRoute.page),
    AutoRoute(page: RecipeChallengeSummaryRoute.page),
  ];
}

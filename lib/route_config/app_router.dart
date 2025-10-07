import 'package:auto_route/auto_route.dart';
import 'package:chef_challenge_project/route_config/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey, required this.showOnboarding});

  final bool showOnboarding;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardRoute.page, initial: showOnboarding),
    AutoRoute(
      page: NavigationBarRoute.page,
      initial: !showOnboarding,
      children: [
        AutoRoute(
          page: ExploreShellRoute.page,
          children: [AutoRoute(page: ExploreRoute.page, initial: true)],
        ),
        AutoRoute(page: FavoritesRoute.page),
        AutoRoute(page: HistoryRoute.page),
      ],
    ),
    AutoRoute(page: RecipeDetailsRoute.page),
    AutoRoute(page: RecipeChallengeRoute.page),
    AutoRoute(page: RecipeChallengeSummaryRoute.page),
  ];
}

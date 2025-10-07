import 'package:chef_challenge_project/data/caching_service.dart';
import 'package:chef_challenge_project/data/recipe_api_service.dart';
import 'package:chef_challenge_project/route_config/app_router.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  
  RecipeApiService().getRecipes();

  final prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );

  final AppRouter appRouter = AppRouter(showOnboarding: prefs.getBool('show_onboarding') ?? true);

  runApp(MainApp(appRouter: appRouter, prefs: prefs));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.appRouter, required this.prefs});

  final SharedPreferencesWithCache prefs;
  final AppRouter appRouter;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(CachingService(widget.prefs))..loadFromCache(),
      child: MaterialApp.router(
        theme: ThemeData.light(), // default light theme
        darkTheme: ThemeData.dark(), // your dark theme
        themeMode: ThemeMode.dark,
        title: 'Chef Challenge',
        routerConfig: widget.appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

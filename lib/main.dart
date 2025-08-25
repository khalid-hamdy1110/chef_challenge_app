import 'package:chef_challenge_project/route_config/app_router.dart';
import 'package:chef_challenge_project/states/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: MaterialApp.router(
        theme: ThemeData.light(), // default light theme
        darkTheme: ThemeData.dark(), // your dark theme
        themeMode: ThemeMode.dark,
        title: 'Chef Challenge',
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

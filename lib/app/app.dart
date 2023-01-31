import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:json_to_dart/config/localization/app_localization.dart';
import 'package:json_to_dart/config/service_locator/service_locator.dart';

import '../config/routes/auto_routes/auto_routes.gr.dart';
import '../core/localization_manager/bloc/localization_manager_bloc.dart';
import '../core/theme/bloc/theme_manager_bloc.dart';
import '../core/theme/data/dark_theme_data.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => sl<ThemeManagerBloc>()),
      BlocProvider(create: (context) => sl<LocalizationManagerBloc>()),
    ], child: const _App());
  }
}

class _App extends StatefulWidget {
  const _App({Key? key}) : super(key: key);

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ThemeManagerBloc>(context).add(Init());
    BlocProvider.of<LocalizationManagerBloc>(context).add(InitializeLocale());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeManagerBloc, ThemeMode?>(
      builder: (context, themeState) {
        if (themeState == null) {
          BlocProvider.of<ThemeManagerBloc>(context).add(Init());
        }

        return BlocBuilder<LocalizationManagerBloc, LocalizationManagerState>(
          builder: (context, localeState) {
            return MaterialApp.router(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', 'US'), // English
                Locale('ne', 'NP'), // nepali
              ],
              locale: localeState.locale,
              themeMode: themeState,
              darkTheme: DarkTheme()(),
              theme: DarkTheme()(),
              title: "JSON-Dart Generator",
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steak_dream/core/l10n/generated/l10n.dart';
import 'package:steak_dream/core/provider/localization_provider.dart';
import 'package:steak_dream/core/provider/theme_provider.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(SteakDreamApp());
}

class SteakDreamApp extends StatelessWidget {
  SteakDreamApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),


      ],
      child: Consumer2<LocalizationProvider, ThemeProvider>(
        builder: (context, localizationProvider, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: localizationProvider.currentLocale,
            theme: context.watch<ThemeProvider>().currentTheme,
            localizationsDelegates: const [
              L10ns.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ky'), Locale('en'), Locale('ru')],
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }}
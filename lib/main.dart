import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:steak_dream/core/l10n/generated/l10n.dart';
import 'package:steak_dream/core/provider/localization_provider.dart';
import 'package:steak_dream/core/provider/theme_provider.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:steak_dream/features/loyalty_program/data/repository/loyalty_repository_impl.dart';
import 'package:steak_dream/features/loyalty_program/domain/usecases/get_loyalty_progress.dart';
import 'package:steak_dream/features/loyalty_program/presentation/bloc/loyalty_bloc.dart';
import 'package:steak_dream/features/stories/presentation/bloc/stories_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const SteakDreamApp());
}

class SteakDreamApp extends StatelessWidget {
  const SteakDreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        BlocProvider(create: (_) => StoriesBloc()),
        BlocProvider(
          create:
              (_) => LoyaltyBloc(GetLoyaltyProgress(LoyaltyRepositoryImpl())),
        ),
      ],
      child: Consumer2<LocalizationProvider, ThemeProvider>(
        builder: (context, localizationProvider, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: localizationProvider.currentLocale,
            theme: themeProvider.currentTheme,
            localizationsDelegates: const [
              L10ns.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ky'), Locale('en'), Locale('ru')],
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}

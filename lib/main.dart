import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warranty_noty/bloc/home_page_bloc.dart';

import 'Pages/homePage.dart';
import 'Pages/searchPage.dart';
import 'constants.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/search', child: (context, args) => const SearchPage())
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: kPrimaryPurple,
            primary: kPrimaryPurple,
            secondary: kSecondaryLightPurple,
            background: kBackgroundWhite),
        textTheme: TextTheme(bodyMedium: GoogleFonts.kanit()),
        iconTheme: const IconThemeData(
          color: kPrimaryDarkPurple,
          size: 24.0
        ),
        useMaterial3: true,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

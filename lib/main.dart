import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Pages/homePage.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()) );
}

class AppModule extends Module {

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
    // ChildRoute('/addProduct', child: (context, args) => const HomePage())
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

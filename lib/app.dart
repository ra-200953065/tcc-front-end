import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final routes = Routes();
      return MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorSchemeSeed: Colors.teal,
        ),
        initialRoute: '/auth/splash',
        routes: routes.getStaticRoutes(),
        onGenerateRoute: (settings) {
          return routes.getDynamicRoutes(settings);
        },
      );
    });
  }
}

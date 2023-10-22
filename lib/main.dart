import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:travel_kenya/app/app.bottomsheets.dart';
import 'package:travel_kenya/app/app.dialogs.dart';
import 'package:travel_kenya/app/app.locator.dart';
import 'package:travel_kenya/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_kenya/ui/common/main_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await ThemeManager.initialise();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      // statusBarColorBuilder: (theme) =>
      //     theme!.appBarTheme.systemOverlayStyle!.statusBarColor,
      defaultThemeMode: ThemeMode.system,
      darkTheme: ThemeData(colorScheme: darkColorScheme),
      lightTheme: ThemeData(colorScheme: lightColorScheme),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.startupView,
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}

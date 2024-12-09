import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ecommerce/components/costum_navigation_bar.dart';
import 'package:ui_ecommerce/routes.dart';
import 'package:ui_ecommerce/screens/splash/splash_screen.dart';
import 'package:ui_ecommerce/state_managements/auth_provider.dart';
import 'package:ui_ecommerce/state_managements/cart_provider.dart';
import 'package:ui_ecommerce/state_managements/favorite_provider.dart';
import 'package:ui_ecommerce/state_managements/search_provider.dart';
import 'package:ui_ecommerce/state_managements/theme_provider.dart';
import 'package:ui_ecommerce/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  runApp(DevicePreview(
    enabled: true,
    defaultDevice: Devices.ios.iPhone13ProMax,
    devices: [Devices.ios.iPhone13ProMax],
    builder: (context) {
      return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider())
      ], child: MainApp(isLoggedIn: isLoggedIn));
    }
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedIn ? CustomNavigationBar.routeName : SplashScreen.routeName,
          theme: themeData(theme.isDarkMode),
          darkTheme: ThemeData.dark(),
          routes: routes,
        );
      },
    );
  }
}

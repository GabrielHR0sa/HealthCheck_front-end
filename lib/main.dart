import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_check/src/view/advice_page.dart';
import 'package:health_check/src/view/alert_page.dart';
import 'package:health_check/src/view/covid_page.dart';
import 'package:health_check/src/view/dengue_page.dart';
import 'package:health_check/src/view/focus_page.dart';
import 'package:health_check/src/view/gripe_page.dart';
import 'package:health_check/src/view/home_page.dart';
import 'package:health_check/src/view/login_page.dart';
import 'package:health_check/src/view/map_page.dart';
import 'package:health_check/src/view/search_page.dart';
import 'package:health_check/src/view/splash_page.dart';
import 'package:health_check/src/view/account_page.dart';
import 'package:health_check/src/view/userInfo_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();

  final themeController = ThemeController(_sharedPreferences);

  runApp(
    MyApp(themeController: themeController),
  );
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  const MyApp({
    super.key,
    required this.themeController,
  });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return ThemeControllerProvider(
        controller: themeController,
        child: MaterialApp(
          title: 'Health Check',
          theme: _buildCurrentTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: ('/splash'),
          routes: {
            ('/home'): (context) => const HomePage(),
            ('/splash'): (context) => const SplashPage(),
            ('/login'): (context) => const LoginPage(),
            ('/focus'): (context) => const FocusPage(),
            ('/account') : (context) => const AccountPage(), 
            ('/userInfo') : (context) => const UserInfoPage(),
            ('/advice') : (context) => const AdvicePage(),
            ('/alert'): (context) => const AlertPage(),
            ('/covid') : (context) => const CovidPage(),
            ('/dengue') : (context) => const DenguePage(),
            ('/gripe') : (context) => const GripePage(),
            ('/search') : (context) => const SearchPage(),
            ('/map') : (context) => const MapPage(),
          },
        ),
      );
      },
    );
  }

 ThemeData _buildCurrentTheme() {
  switch (themeController.currentTheme) {
    case "dark":
      return ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A9AB4),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 46, 46, 46),
        textTheme: TextTheme(
          bodySmall: GoogleFonts.inter(
            color: const Color.fromARGB(255, 46, 46, 46),
          ),
          bodyMedium: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
          bodyLarge: GoogleFonts.inter(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
          headlineSmall: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 18,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.redAccent,
            decoration: TextDecoration.underline,
          ),
          titleSmall: GoogleFonts.inter(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.inter(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
          titleLarge: GoogleFonts.inter(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontStyle: FontStyle.italic,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.inter(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 56, 113, 193),
          onPrimary: Color.fromARGB(255, 56, 113, 193),
          secondary: Colors.white,
          onSecondary: Color.fromARGB(255, 56, 113, 193),
          error: Colors.black,
          onError: Colors.black,
          background: Color.fromARGB(255, 46, 46, 46),
          onBackground: Color.fromARGB(255, 46, 46, 46),
          surface: Color.fromARGB(255, 255, 255, 255),
          onSurface: Colors.black,
        ),
      );
    case "light":
    default:
      return ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 56, 113, 193),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 212, 212, 212),
        textTheme: TextTheme(
          bodySmall: GoogleFonts.inter(
            color: const Color.fromARGB(255, 212, 212, 212),
          ),
          bodyMedium: GoogleFonts.inter(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
          bodyLarge: GoogleFonts.inter(
            color: Colors.black.withOpacity(0.5),
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
          headlineSmall: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 18,
            color: const Color.fromARGB(255, 32, 32, 32),
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.redAccent,
            decoration: TextDecoration.underline,
          ),
          titleSmall: GoogleFonts.inter(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.inter(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
          titleLarge: GoogleFonts.inter(
            color: const Color.fromARGB(255, 212, 212, 212),
            fontStyle: FontStyle.italic,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.inter(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 56, 113, 193),
          onPrimary: Color.fromARGB(255, 56, 113, 193),
          secondary: Colors.white,
          onSecondary: Color.fromARGB(255, 56, 113, 193),
          error: Colors.black,
          onError: Colors.black,
          background: Color.fromARGB(255, 212, 212, 212),
          onBackground: Color.fromARGB(255, 255, 255, 255),
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      );
  }
}

}
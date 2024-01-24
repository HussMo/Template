import 'package:go_router/go_router.dart';
import 'package:theme_app/features/Splash/splash_screen.dart';
import 'package:theme_app/features/home/presentation/pages/home_screen.dart';
import 'package:theme_app/features/settings/presentation/pages/settings.dart';

abstract class AppRouter {
  static const kHomeView = '/home_screen';
  static const kSettingsView = '/settings';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kSettingsView,
        builder: (context, state) =>  const SettingsPage(),
      ),
    ],
  );
}

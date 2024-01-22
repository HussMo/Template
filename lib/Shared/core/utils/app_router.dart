
import 'package:go_router/go_router.dart';
import 'package:theme_app/features/Splash/splash_screen.dart';
import 'package:theme_app/features/home/presentation/pages/home_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/home_screen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>const SplashView() ,
      ),
      GoRoute(
        path: kHomeView,
       builder: (context, state) => const HomeScreen(),
       ),
    ],
  );
}

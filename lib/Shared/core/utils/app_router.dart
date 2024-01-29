import 'package:go_router/go_router.dart';
import 'package:theme_app/features/Login_screen/pages/login_screen.dart';
import 'package:theme_app/features/Login_screen/pages/signup_screen.dart';
import 'package:theme_app/features/QR_Scanner/presentation/pages/readqr.dart';
import 'package:theme_app/features/QR_Scanner/presentation/pages/scanqr.dart';
import 'package:theme_app/features/Splash/splash_view.dart';
import 'package:theme_app/features/home/presentation/pages/home_screen.dart';
import 'package:theme_app/features/settings/presentation/pages/settings.dart';

abstract class AppRouter {
  static const kHomeView = '/home_screen';
  static const kSettingsView = '/settings';
  static const kGenerateQRView = '/QRGeneratorScreen';
  static const kScannerQRView = '/QRScannerScreen';
  static const kLoginView = '/login';
  static const kSignUpView = '/signup';

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
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: kGenerateQRView,
        builder: (context, state) => const QRGeneratorScreen(),
      ),
      GoRoute(
        path: kScannerQRView,
        builder: (context, state) =>  const QRScannerScreen(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) =>  const LoginPage()),
      GoRoute(path: kSignUpView, builder: (context, state) =>  const SignupPage() ),
    ],
  );
}

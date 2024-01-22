import 'package:flutter/material.dart';
import 'package:theme_app/Shared/core/utils/app_router.dart';
import 'package:theme_app/Shared/style/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router ,
      debugShowCheckedModeBanner: false,
      title: 'Template',
      theme: AppThemes.dark,
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:theme_app/Shared/core/utils/app_router.dart';
import 'package:theme_app/Shared/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

 @override
 State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool _doubleBackToExitPressedOnce = false;

 @override
 Widget build(BuildContext context) {
    var currentIndex = 0;
    return WillPopScope(
      onWillPop: () async {
        if (_doubleBackToExitPressedOnce) {
          if (Platform.isAndroid) {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          } else if (Platform.isIOS) {
            exit(0);
          }
          return false;
        }
        _doubleBackToExitPressedOnce = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blue,
            content: Text("Press back again to exit."),
          ),
        );
        await Future.delayed(const Duration(seconds: 3));
        _doubleBackToExitPressedOnce = false;
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {GoRouter.of(context).push(AppRouter.kSettingsView);}
            ),
          ],
          title: const Text(
            'iGenTech',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(child: Image.asset('assets/images/igentech.png')),
         bottomNavigationBar: CustomBottomNavigationBar(currentIndex: currentIndex),

      ),
    );
 }
}

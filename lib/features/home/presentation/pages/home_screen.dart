// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:theme_app/Shared/core/utils/app_router.dart';
import 'package:theme_app/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

 @override
 State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool _doubleBackToExitPressedOnce = false;

 @override
 Widget build(BuildContext context) {
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
        await Future.delayed(const Duration(seconds: 1));
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
          title: Text(
            S.of(context).title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body:   Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[100],
                ),
                child: TextButton(onPressed: 
                () {GoRouter.of(context).push(AppRouter.kGenerateQRView);}
                , child: Text(
                  S.of(context).home_title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[100],
                ),
                child: TextButton(onPressed: 
                () {GoRouter.of(context).push(AppRouter.kScannerQRView);}
                , child: const Text(
                  "Scaner QR Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              ),
            ],
          )
        ),
      ),
    );
 }
}

// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theme_app/Shared/core/utils/app_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState(currentIndex: currentIndex);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex;

  _CustomBottomNavigationBarState({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        switch (index) {
          case 0:
            GoRouter.of(context).push(AppRouter.kHomeView);
            break;
          case 1:
            GoRouter.of(context).push(AppRouter.kGenerateQRView);
            break;
          case 2:
            GoRouter.of(context).push(AppRouter.kScannerQRView);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'QR Code',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scanner',
        ),
      ],
    );
  }
}

import 'package:echo/responsive/mobile_Screen_layout.dart';
import 'package:echo/responsive/web_screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return WebScreenLayout();
        } else {
          return MobileScreenLayout();
        }
      },
    );
  }
}

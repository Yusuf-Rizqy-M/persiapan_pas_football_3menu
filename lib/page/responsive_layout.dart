import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/responsive_controller.dart';
import 'dashboard_page.dart';
import 'dashboard_page_rail.dart';


class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout({super.key});

  final ResponsiveController responsiveController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (responsiveController.isMobile()) {
        return DashboardPage();
      } else if(responsiveController.isTablet()){
        return DashboardPageRail();
      }
      else{
        return Placeholder();
      }
    });
  }
}

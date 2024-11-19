import 'package:get/get.dart';
import '../controller/dashboard_controllers.dart';

class MyBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => DashboardControllers());
  }
}
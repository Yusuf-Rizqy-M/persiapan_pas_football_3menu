import 'package:get/get.dart';

class DashboardControllers extends GetxController{
  var selectedindex = 0.obs;

  //action pindah menu
  void changeMenu (int index){
    selectedindex.value = index;
  }
}
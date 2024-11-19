import 'package:get/get.dart';

import '../Api/Api_Model.dart';
import 'api_service_laliga.dart';

class ApiControllerLaliga extends GetxController {
  var isLoading = true.obs;
  var postList = <ApiModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiServiceLaliga().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}

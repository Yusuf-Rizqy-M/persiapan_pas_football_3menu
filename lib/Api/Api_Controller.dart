import 'package:get/get.dart';
import 'Api_Model.dart';
import 'Api_Service.dart';

class ApiController extends GetxController {
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
      var posts = await ApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}

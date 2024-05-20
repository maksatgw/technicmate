import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:technicmate/features/search/model/search_model.dart';
import 'package:technicmate/features/search/service/search_service.dart';

class UserSearchController extends GetxController {
  TextEditingController searchTextEdit = TextEditingController();
  final SearchService service = SearchService();
  var model = UserSearchModel().obs;
  var isLoading = false.obs;

  Future<void> searchUser(String? query) async {
    try {
      isLoading.value = true;
      var result = await service.searchUser(query);
      if (result != null) {
        model.value = result;
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}

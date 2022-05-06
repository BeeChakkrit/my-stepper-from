import 'package:add_data/model/user_model.dart';
import 'package:add_data/services/user_services.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var userList = <User>[].obs;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    UserService requsert = UserService();
    requsert.getUser().then((value) {
      print('value ==> ${value.data}');
      if (value.statusCode == 200) {
        for (var item in value.data) {
          userList.add(User.fromJson(item));
          print('item ==> ${item}');
        }
      } else {
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  // void fetchUser() async {
  //   var users = await UserService().getUser();
  //   // print(users);
  //   if (users != null) {
  //     //  userList.value = users;
  //   }
  // }

  // obx(ListView Function(dynamic data) param0) {}
}

import 'package:add_data/services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RecordController extends GetxController {
  var currentStep = 0.obs;
  TextEditingController addfirstname = TextEditingController();
  TextEditingController addlastname = TextEditingController();
  TextEditingController addphone = TextEditingController();
  TextEditingController addidcard = TextEditingController();
  TextEditingController addemail = TextEditingController();
  TextEditingController addhousenumber = TextEditingController();
  TextEditingController addmoo = TextEditingController();
  TextEditingController addsubdistrict = TextEditingController();
  TextEditingController adddistrict = TextEditingController();
  TextEditingController addprovince = TextEditingController();

  void addUser() async {
    UserService requsert = UserService();
    var reqbody = await {
      "id": null,
      "firstname": addfirstname.text,
      "lastname": addlastname.text,
      "phone": addphone.text,
      "idcard": addidcard.text,
      "email": addemail.text,
      "address": {
        "housenumber": addhousenumber.text,
        "moo": addmoo.text,
        "subdistrict": addsubdistrict.text,
        "district": adddistrict.text,
        "province": addprovince.text
      }
    };
    print('reqbody ===> ${reqbody}');
    await requsert.postUser(reqbody).then(
          (value) => {
            if (value.statusCode == 201)
              {print('value ===> ${value}'), Get.offAllNamed('/home')}
          },
        );
  }
}

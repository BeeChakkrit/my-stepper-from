import 'package:add_data/home/controllers/home_controller.dart';
import 'package:add_data/record/views/record_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  final userController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        title: const Center(
            child: Text(
          'โชว์ข้อมูล',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.deepPurple.shade200,
          child: Column(
            children: [
              Expanded(
                child:
                    // GetX<HomeController>(
                    //   builder: (controller) {
                    //     // print(userController.userList);
                    //     return ListView.builder(
                    //         itemCount: controller.userList.length,
                    //         itemBuilder: (context, index) {
                    //           return ListTile(
                    //             title: Text(
                    //                 '${userController.userList[index].firstname}'),
                    //             // selected: Text(
                    //             //     '${userController.userList[index].lastname}'),
                    //           );
                    //         });
                    //   },
                    // ),

                    Obx(
                  () => ListView.builder(
                    itemCount: userController.userList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(10, 11, 10, 5),
                      child: SizedBox(
                        child: InkWell(
                          onTap: () {
                            print('${userController.userList[index].id}');
                          },
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${userController.userList[index].firstname}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${userController.userList[index].lastname}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${userController.userList[index].phone}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    '${userController.userList[index].email}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${userController.userList[index].address?.housenumber}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      Text(
                                        '${userController.userList[index].address?.moo}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      Text(
                                        '${userController.userList[index].address?.subdistrict}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      Text(
                                        '${userController.userList[index].address?.district}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${userController.userList[index].address?.province}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ListTile(
                    //   title: Text(
                    //     '${userController.userList[index].firstname}',
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Get.toNamed('/record')},
        child: const Icon(
          Icons.add,
          color: Colors.red,
          size: 52,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

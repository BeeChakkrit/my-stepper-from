import 'package:add_data/record/controllers/record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordView extends GetView<RecordController> {
  final RecordController _recordController = Get.put(RecordController());

  void _addUser() {
    _recordController.addUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Stepper',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple.shade400,
        centerTitle: true,
      ),
      body: Obx(
        () => Stepper(
          type: StepperType.vertical,
          steps: buildStep(),
          currentStep: _recordController.currentStep.value,
          onStepContinue: () {
            if (_recordController.currentStep.value == buildStep().length - 1) {
              _addUser();
              print("Send data to server");
            } else {
              _recordController.currentStep.value++;
            }
          },
          onStepCancel: () {
            _recordController.currentStep.value == 0
                ? null
                : _recordController.currentStep.value--;
          },
          onStepTapped: (index) {
            _recordController.currentStep.value = index;
          },
        ),
      ),
    ));
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text('Personal'),
          content: formStep1(_recordController),
          isActive: _recordController.currentStep.value >= 0,
          state: _recordController.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Business'),
          content: formStep2(_recordController),
          isActive: _recordController.currentStep.value >= 1,
          state: _recordController.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
    ];
  }
}

Widget formStep1(_recCtrl) {
  return Column(
    children: [
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            "ชื่อ",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addfirstname,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            "นามสกุล",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addlastname,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            "เบอร์โทร",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addphone,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            "เลขบัตรประชาชน",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addidcard,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            "อีเมล",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addemail,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

Widget formStep2(_recCtrl) {
  return Column(
    children: [
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text("บ้านเลขที่", style: TextStyle(fontSize: 17))
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addhousenumber,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text("หมู่ที่", style: TextStyle(fontSize: 17))
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addmoo,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text("ตำบล", style: TextStyle(fontSize: 17))
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addsubdistrict,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text("อำเภอ", style: TextStyle(fontSize: 17))
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.adddistrict,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        children: const [
          Text(
            '*',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text("จังหวัด", style: TextStyle(fontSize: 17))
        ],
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: _recCtrl.addprovince,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.indigo.shade300,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

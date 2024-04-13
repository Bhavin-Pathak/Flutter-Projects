// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
//GetX
import 'package:get/get.dart';
//MainController
import 'package:split_money/Screens/Home/main_controller.dart';
//ResultScreen
import 'package:split_money/Screens/Update/result_screen.dart';
//Models
import 'package:split_money/Models/result_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // initializing MainController
  final homeController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
          'Split-Money With Friends',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  color: Colors.blue.shade700.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Amount',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    '${homeController.totalAmount.value} ₹',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Friends :-',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'Tax :-',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'Tip :-',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                      homeController.currentSliderValue.value
                                          .round()
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${homeController.taxAmount.value.toString()} %',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${homeController.tipAmount.value.toString()} ₹',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'How Many Friends Do You Have ??',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => Slider(
                    activeColor: Colors.deepOrange,
                    label: homeController.currentSliderValue.value
                        .round()
                        .toString(),
                    min: 1,
                    max: 15,
                    divisions: 15,
                    value: homeController.currentSliderValue.value.toDouble(),
                    onChanged: (value) {
                      homeController.currentSliderValue.value = value.toInt();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Tax ( % )',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => homeController.taxDecrease(),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.deepOrange,
                                        child: Icon(
                                            Icons.horizontal_rule_rounded,
                                            color: Colors.white,
                                            size: 32),
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        '${homeController.taxAmount.value} %',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => homeController.tipIncrease(),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.deepOrange,
                                        child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.white,
                                            size: 32),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  label: const Text('Tip Amount (Optional)'),
                                ),
                                controller: homeController.tipAmountController,
                                onChanged: (value) {
                                  homeController.tipAmount.value =
                                      homeController.tipAmountController.text;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'Enter Total Amount Of Bill',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      label: const Text(
                        'Total Amount',
                      ),
                    ),
                    controller: homeController.totalAmountController,
                    onChanged: (value) {
                      homeController.totalAmount.value =
                          homeController.totalAmountController.text;
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                // child = 6 [ Split Bill Button Widget]
                ElevatedButton(
                  onPressed: () {
                    // Testing and Checking the values first
                    if (homeController.totalAmount.value == '0' ||
                        homeController.totalAmount.value.length.isEqual(0)) {
                      Get.snackbar('Error', 'Please Enter Total Amount');
                    } else {
                      if (homeController.tipAmount.value.length.isEqual(0)) {
                        homeController.tipAmount.value = '0';

                        Get.to(() => ResultScreen(
                              resultData: ResultData(
                                homeController.equallyDivide(),
                                homeController.currentSliderValue.value
                                    .round()
                                    .toString(),
                                homeController.taxAmount.value.toString(),
                                homeController.tipAmount.value.toString(),
                              ),
                            ));
                      } else {
                        Get.to(() => ResultScreen(
                              resultData: ResultData(
                                homeController.equallyDivide(),
                                homeController.currentSliderValue.value
                                    .round()
                                    .toString(),
                                homeController.taxAmount.value.toString(),
                                homeController.tipAmount.value.toString(),
                              ),
                            ));
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Split Now',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

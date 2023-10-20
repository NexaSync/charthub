import 'package:flutter/material.dart';
import 'package:charthub/lineChart.dart';
import 'package:charthub/barChart.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'ChartHub',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: LineChart(
          size: Get.width - 20,
          items: [5, 1, 4, 0, 9, 4, 2, 10, 7],
          showValues: true,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        )),
      ),
    );
  }
}

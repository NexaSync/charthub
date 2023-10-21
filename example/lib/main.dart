import 'package:charthub/pieChart.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Line Graph',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              LineChart(
                  size: Get.width - 20,
                  items: [23, 45, 12, 60, 44, 10, 54, 34, 23]),
              SizedBox(
                height: 40,
              ),
              Text(
                'Pie Chart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 120,
              ),
              PieChart(size: Get.width / 2, items: [30, 22, 43, 12, 56, 70]),
              SizedBox(
                height: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Bar Graph',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              BarChart(size: Get.width - 20, items: [100, 40, 300, 50, 450]),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

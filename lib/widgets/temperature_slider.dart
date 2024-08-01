import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/temperature_viewmodel.dart';

class TemperatureSlider extends StatelessWidget {
  final TemperatureViewModel temperatureViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            'Adjust Temperature',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Obx(() => Slider(
            value: temperatureViewModel.currentTemperature.value,
            min: 16.0,
            max: 30.0,
            divisions: 14,
            label: temperatureViewModel.currentTemperature.value.toString(),
            onChanged: (value) {
              temperatureViewModel.updateTemperature(value);
            },
          )),
        ],
      ),
    );
  }
}

import 'package:get/get.dart';

class TemperatureViewModel extends GetxController {
  var currentTemperature = 23.0.obs;

  void updateTemperature(double value) {
    currentTemperature.value = value;
  }
}

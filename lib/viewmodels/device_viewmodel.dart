import 'package:get/get.dart';
import '../models/device_model.dart';

class DeviceViewModel extends GetxController {
  var devices = <Device>[].obs;
  var selectedDevice = ''.obs;

  @override
  void onInit() {
    super.onInit();
    devices.addAll([
      Device(name: 'Lights', icon: 'assets/icons/lights_background.png', isActive: true, backgroundImage: 'assets/images/lights_background.png'),
      Device(name: 'Smart TV', icon: 'assets/icons/tv.png', isActive: false, backgroundImage: 'assets/images/tv_background.jpg'),
      Device(name: 'Air Conditioner', icon: 'assets/icons/ac.png', isActive: false, backgroundImage: 'assets/images/ac_background.jpg'),
      Device(name: 'Heater', icon: 'assets/icons/heater.png', isActive: true, backgroundImage: 'assets/images/heater_background.jpg'),
      Device(name: 'Fan', icon: 'assets/icons/fan.png', isActive: false, backgroundImage: 'assets/images/fan_background.jpg'),
      Device(name: 'Fridge', icon: 'assets/icons/fridge.png', isActive: true, backgroundImage: 'assets/images/fridge_background.jpg'),
    ]);

    selectedDevice.value = devices[0].backgroundImage; // Default background
  }

  void toggleDevice(int index) {
    devices[index].isActive = !devices[index].isActive;
    selectedDevice.value = devices[index].backgroundImage; // Change background
    update();
  }
}

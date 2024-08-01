import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/device_viewmodel.dart';
import '../viewmodels/temperature_viewmodel.dart';
import '../widgets/temperature_slider.dart';
import 'device_card.dart';
import '../widgets/background_image.dart';

class HomeScreen extends StatelessWidget {
  final DeviceViewModel deviceViewModel = Get.put(DeviceViewModel());
  final TemperatureViewModel temperatureViewModel = Get.put(TemperatureViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Obx(() => BackgroundImage(deviceViewModel.selectedDevice.value)),

          // Foreground UI components
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button with touch effect
                    GestureDetector(
                      onTap: () {
                        // Handle back button tap
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white24,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Office title with drop shadow
                    Text(
                      'Office',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Active devices with a glow effect
                    Text(
                      '${deviceViewModel.devices.length} devices active',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.white24,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Temperature display with gradient background
                    Obx(
                          () => Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.thermostat, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              '${temperatureViewModel.currentTemperature.value.toInt()}°C',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.black38,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Device cards with 3D touch effect
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: deviceViewModel.devices.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        deviceViewModel.toggleDevice(index);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        transform: Matrix4.translationValues(
                          0, deviceViewModel.devices[index].isActive ? -10 : 0, 0,
                        ),
                        child: DeviceCard(
                          device: deviceViewModel.devices[index],
                          onTap: () {
                            deviceViewModel.toggleDevice(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Slider with custom thumb and track
              TemperatureSlider(),
            ],
          ),
          // Floating action button with bounce effect
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
              child: FloatingActionButton(
                onPressed: () {
                  // Handle FAB click
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.orangeAccent,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async'; // Newly added
import '../models/device_model.dart';

class DeviceCard extends StatefulWidget { // Changed from StatelessWidget to StatefulWidget
  final Device device;
  final VoidCallback onTap;

  DeviceCard({required this.device, required this.onTap});

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool _showSparkle = false; // Newly added

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showSparkle = true; // Trigger sparkle effect
        });
        widget.onTap();
        Timer(Duration(milliseconds: 500), () { // Reset sparkle after animation
          setState(() {
            _showSparkle = false;
          });
        });
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.device.icon, width: 40, height: 40),
                SizedBox(height: 10),
                Text(widget.device.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    )),
                SizedBox(height: 10),
                // Status Indicator
                CircleAvatar(
                  radius: 15,
                  backgroundColor: widget.device.isActive ? Colors.green : Colors.red,
                ),
              ],
            ),
          ),
          if (_showSparkle) // Conditionally show sparkle effect
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: CustomPaint(
                  painter: SparklePainter(), // Newly added
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SparklePainter extends CustomPainter { // Newly added
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    for (int i = 0; i < 10; i++) {
      final double dx = centerX + (i * 5 - 20) % size.width;
      final double dy = centerY + (i * 5 - 20) % size.height;
      canvas.drawCircle(Offset(dx, dy), 5, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Import ColorPicker

class LEDControlPage extends StatefulWidget {
  @override
  _LEDControlPageState createState() => _LEDControlPageState();
}

class _LEDControlPageState extends State<LEDControlPage> {
  double brightness = 0.5; // Initial brightness value
  Color selectedColor = Colors.white; // Initial selected color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED Control'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Brightness',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: brightness,
              onChanged: (value) {
                setState(() {
                  brightness = value;
                  // Update the selected color with adjusted brightness
                  selectedColor = Color.lerp(Colors.black, selectedColor, brightness)!;
                });
                // Implement brightness control logic here
              },
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: '${(brightness * 100).round()}%',
            ),
            SizedBox(height: 20.0),
            Text(
              'Special Light Mode',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            IconSlider(),
            SizedBox(height: 20.0),
            Text(
              'Select Color',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
              SizedBox(height: 20.0),
              SizedBox(
                height:350,
              child: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: selectedColor,
                  onColorChanged: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                    // Handle color change logic here
                  },
                  showLabel: true,
                  pickerAreaHeightPercent: 0.8,
                ),
              ),
              ),],
        ),
      ),
    );
  }
}

class IconSlider extends StatelessWidget {
  final List<Widget> iconsWithText = [
    IconWithText(icon: Icons.home, text: 'Home'),
    IconWithText(icon: Icons.work, text: 'Work'),
    IconWithText(icon: Icons.shopping_cart, text: 'Shopping'),
    IconWithText(icon: Icons.school, text: 'School'),
    // Add more IconWithText widgets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: iconsWithText,
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: 150,
      height: 150, // Add padding for the circular edges
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.rectangle, // Use a circular shape
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 50.0),
          SizedBox(height: 20.0),
          Text(text),
        ],
      ),
    );
  }
}

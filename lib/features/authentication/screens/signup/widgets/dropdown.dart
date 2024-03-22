import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        items: [
          
        ],
      ),
    );
  }
}
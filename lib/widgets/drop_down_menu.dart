import 'package:flutter/material.dart';
class DropdownField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String initialValue;
  final Function(String) onChanged; // Add a callback for value changes

  const DropdownField({
    super.key,
    required this.icon,
    required this.label,
    required this.initialValue,
    required this.onChanged, // Initialize the callback
  });

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.greenAccent),
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.greenAccent),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedValue,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedValue = newValue;
                });
                widget.onChanged(newValue); // Call the callback when value changes
              }
            },
            items: <String>[
              "electronics",
              "jewelery",
              "men's clothing",
              "women's clothing"
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

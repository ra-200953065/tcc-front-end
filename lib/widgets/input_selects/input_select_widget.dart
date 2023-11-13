import 'package:flutter/material.dart';

class InputSelectWidget extends StatefulWidget {
  const InputSelectWidget({
    super.key,
    required this.label,
    required this.items,
    required this.fn,
    required this.initValue,
  });

  final String label;
  final List<String> items;
  final Function fn;
  final String? initValue;

  @override
  State<InputSelectWidget> createState() => _InputSelectWidgetState();
}

class _InputSelectWidgetState extends State<InputSelectWidget> {
  Color color = Colors.grey.shade600;

  void setColor(String? text) {
    if (text == null) {
      setState(() => color = Colors.grey.shade600);
    } else {
      setState(() => color = Colors.green);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.initValue != null) {
      color = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    String? dropdownValue = widget.initValue;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconEnabledColor: color,
                onChanged: (String? value) {
                  setColor(value!);

                  widget.fn(value);
                },
                style: TextStyle(
                  color: dropdownValue == null ? Colors.black : color,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.5,
                    horizontal: 15.0,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: widget.label,
                  labelStyle: TextStyle(color: color),
                ),
                items: widget.items.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}

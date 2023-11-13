import 'package:flutter/material.dart';

class InputNumberWidget extends StatefulWidget {
  const InputNumberWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.suffix,
    required this.nextButton,
  });

  final String label;
  final TextEditingController controller;
  final String suffix;
  final bool nextButton;

  @override
  State<InputNumberWidget> createState() => _InputNumberWidgetState();
}

class _InputNumberWidgetState extends State<InputNumberWidget> {
  Color color = Colors.grey.shade600;

  void setColor(String text) {
    if (text == '') {
      setState(() => color = Colors.grey.shade600);
    } else {
      setState(() => color = Colors.green);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller.text != '') {
      color = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: widget.nextButton == true
                    ? TextInputAction.next
                    : TextInputAction.done,
                style: const TextStyle(
                  color: Colors.green,
                ),
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: color,
                    ),
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
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    labelText: widget.label,
                    suffixText: widget.suffix,
                    suffixStyle: TextStyle(color: color)),
                controller: widget.controller,
                onChanged: (value) => setColor(value),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}

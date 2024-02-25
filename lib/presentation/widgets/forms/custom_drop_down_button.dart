import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    this.width,
    this.height,
    required this.items,
    required this.hint,
    required this.controller,
  });

  final double? width;
  final double? height;
  final List<String> items;
  final String hint;
  final TextEditingController controller;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 320,
      height: widget.height ?? 60,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: const Icon(Icons.person),
        title: DropdownButton<String>(
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          value:
              widget.controller.text.isNotEmpty ? widget.controller.text : null,
          items: widget.items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.controller.text = newValue ?? '';
            });
          },
          hint: Text(widget.hint),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    this.width,
    this.height,
    required this.items,
    required this.hint,
  });

  final double? width;
  final double? height;
  final List<String> items;
  final String hint;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 320,
      height: widget.height ?? 60,
      child: DropdownButton(
        icon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.arrow_downward_outlined),
        ),
        isExpanded: true,
        underline: Container(
          height: 0.5,
          color: Colors.black,
        ),
        items: widget.items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          print(value);
        },
        hint: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width: 12),
              Text(
                widget.hint,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

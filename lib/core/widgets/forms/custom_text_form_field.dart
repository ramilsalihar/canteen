import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.icon,
    this.hintText,
    this.readOnly,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.height,
    this.width,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final double? width;
  final double? height;
  final Icon icon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? hideText;

  @override
  void initState() {
    hideText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 320,
      height: widget.height ?? 60,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          hintText: widget.hintText ?? '',
          hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.grey,
                fontSize: 14,
              ),
          prefixIcon: widget.icon,
          suffixIcon: widget.obscureText == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      hideText = !hideText!;
                    });
                  },
                  icon: Icon(
                    hideText == true ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          errorMaxLines: 2,
          isCollapsed: true,
        ),
        obscureText: hideText!,
        controller: widget.controller,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        validator: widget.validator,
      ),
    );
  }
}

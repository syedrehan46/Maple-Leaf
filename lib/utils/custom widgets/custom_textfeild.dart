import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool showCharCount;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLength,
    this.keyboardType,
    this.showCharCount = true,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
    _currentText = widget.controller.text;

    // Add listener to update character count in real-time
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    // Only update state if text actually changed
    if (_currentText != widget.controller.text) {
      _currentText = widget.controller.text;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = "* ${widget.label}";
    final int currentLength = widget.controller.text.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          // We don't use the built-in maxLength to show our own counter
          maxLength: widget.showCharCount ? null : widget.maxLength,
          buildCounter: (_, {required currentLength, required isFocused, required maxLength}) {
            return null; // Hide the built-in counter
          },
          onChanged: (text) {
            // Manually enforce maxLength if needed
            if (widget.maxLength != null && text.length > widget.maxLength!) {
              widget.controller.text = text.substring(0, widget.maxLength);
              widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.maxLength!),
              );
            }

            // Update our tracking variable
            _currentText = widget.controller.text;
          },
          decoration: InputDecoration(
            hintText: !_focusNode.hasFocus ? displayText : null,
            labelStyle: const TextStyle(color: Color(0xff504E4E)),
            labelText: _focusNode.hasFocus ? displayText : null,
            counterText: "", // Hide default counter
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),

        // Show character count outside the text field
        if (widget.showCharCount && widget.maxLength != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 2),
            child: Text(
              "$currentLength/${widget.maxLength}",
              style: TextStyle(
                fontSize: 12,
                color: currentLength > (widget.maxLength! * 0.8)
                    ? (currentLength >= widget.maxLength! ? AppColors.blackColor : AppColors.blackColor)
                    : AppColors.blackColor,
              ),
            ),
          ),
      ],
    );
  }
}
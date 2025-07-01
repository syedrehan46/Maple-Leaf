import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomTextField1 extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool showCharCount;
  final double? width;

  final bool isIgnorePointer;

  const CustomTextField1({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLength,
    this.keyboardType,
    this.showCharCount = true,
    this.width, this.isIgnorePointer = false,

  }) : super(key: key);

  @override
  State<CustomTextField1> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField1> {
  late FocusNode _focusNode;
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
    _currentText = widget.controller.text;
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (_currentText != widget.controller.text) {
      _currentText = widget.controller.text;
      if (mounted) setState(() {});
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
    final double effectiveWidth = widget.width ?? MediaQuery.of(context).size.width;
    final String displayText = "${widget.label}";
    final int currentLength = widget.controller.text.length;

    return SizedBox(
      width: effectiveWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            maxLength: widget.showCharCount ? null : widget.maxLength,
            buildCounter: (_, {required currentLength, required isFocused, required maxLength}) => null,
            onChanged: (text) {
              if (widget.maxLength != null && text.length > widget.maxLength!) {
                widget.controller.text = text.substring(0, widget.maxLength);
                widget.controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.maxLength!),
                );
              }
              _currentText = widget.controller.text;
            },
            decoration: InputDecoration(
              hintText: !_focusNode.hasFocus ? displayText : null,
              labelStyle: const TextStyle(color: Color(0xff504E4E)),
              labelText: _focusNode.hasFocus ? displayText : null,
              counterText: "",
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
          if (widget.showCharCount && widget.maxLength != null)
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 2),
              child: Text(
                "$currentLength/${widget.maxLength}",
                style: TextStyle(
                  fontSize: 12,
                  color: currentLength > (widget.maxLength! * 0.8)
                      ? AppColors.blackColor
                      : AppColors.blackColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/utils/colors.dart';

class CustomField extends StatefulWidget {
  final String? label;
  final Widget? prefix;
  final String hint;
  final bool obscure;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final int? maxLines;
  final TextInputAction? inputAction;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Color? focusedColor;

  // 1. Private Base Constructor
  const CustomField._({
    super.key,
    this.label,
    this.prefix,
    required this.hint,
    required this.controller,
    this.obscure = false,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.focusedColor,
  });

  // 2. Standard Text Field
  const CustomField({
    Key? key,
    String? label,
    Widget? prefix,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    FormFieldValidator<String>? validator,
    TextInputAction? inputAction = TextInputAction.next,
    bool readOnly = false,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    Color? focusedColor,
  }) : this._(
         key: key,
         label: label,
         prefix: prefix,
         hint: hint,
         controller: controller,
         keyboardType: keyboardType,
         suffixIcon: suffixIcon,
         validator: validator,
         inputAction: inputAction,
         maxLines: 1,
         readOnly: readOnly,
         onChanged: onChanged,
         inputFormatters: inputFormatters,
         focusedColor: focusedColor,
       );

  // 3. Password Field
  const CustomField.password({
    Key? key,
    String? label = "Password",
    required String hint,
    required TextEditingController controller,
    FormFieldValidator<String>? validator,
    TextInputAction? inputAction = TextInputAction.done,
    ValueChanged<String>? onChanged,
    Color? focusedColor,
  }) : this._(
         key: key,
         label: label,
         hint: hint,
         controller: controller,
         obscure: true,
         maxLines: 1,
         validator: validator,
         inputAction: inputAction,
         onChanged: onChanged,
         focusedColor: focusedColor,
       );

  // 4. Multiline/Description Field
  const CustomField.multiline({
    Key? key,
    String? label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 5,
    FormFieldValidator<String>? validator,
    bool readOnly = false,
    ValueChanged<String>? onChanged,
    Color? focusedColor,
  }) : this._(
         key: key,
         label: label,
         hint: hint,
         controller: controller,
         maxLines: maxLines,
         keyboardType: TextInputType.multiline,
         inputAction: TextInputAction.newline,
         validator: validator,
         readOnly: readOnly,
         onChanged: onChanged,
         focusedColor: focusedColor,
       );

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late bool _isHidden;

  @override
  void initState() {
    super.initState();
    _isHidden = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget textField = TextFormField(
      readOnly: widget.readOnly,
      maxLines: widget.obscure ? 1 : widget.maxLines,
      controller: widget.controller,
      obscureText: _isHidden,
      keyboardType: widget.keyboardType,
      textInputAction: widget.inputAction,
      inputFormatters: widget.inputFormatters,
      style: textTheme.bodyLarge,
      onChanged: widget.onChanged,
      validator:
          widget.validator ??
          (val) {
            if (val == null || val.trim().isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
      decoration: InputDecoration(
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        hintText: widget.hint,
        prefixIcon: widget.prefix,
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  _isHidden ? Icons.visibility_off : Icons.visibility,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                onPressed: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
              )
            : widget.suffixIcon,
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: widget.focusedColor ?? primaryColor),
        ),
      ),
    );

    if (widget.label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.label!, style: textTheme.titleMedium),
          const SizedBox(height: 5),
          textField,
        ],
      );
    }

    return textField;
  }
}

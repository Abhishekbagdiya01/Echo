import 'package:echo/utils/colors.dart';
import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';

class InputFormField extends StatefulWidget {
  final TextEditingController controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const InputFormField(
      {required this.controller,
      this.fieldKey,
      this.isPasswordField,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  State<InputFormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<InputFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: interTextStyle(color: blackColor),
      controller: widget.controller,
      keyboardType: widget.inputType,
      key: widget.fieldKey,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(100, 186, 183, 108))),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(100, 186, 183, 108))),
        hintText: widget.hintText,
        hintStyle: interTextStyle(color: blackColor.withOpacity(.4)),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: widget.isPasswordField == true
              ? Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color:
                      _obscureText ? blackColor.withOpacity(0.7) : topLogoColor,
                )
              : Text(""),
        ),
      ),
    );
  }
}

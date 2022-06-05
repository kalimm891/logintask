// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test/theme/text_style.dart';

class EmailTextField extends StatelessWidget {
  final String? text;
  final TextEditingController? control;
  Function? onChanged;
  TextInputType? inputType;
  final TextStyle? styles;

  EmailTextField(
      {Key? key,
      this.inputType,
      this.text,
      this.control,
      this.styles,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      onTap: () {},
      style: blackDarkM14,
      onChanged: (value) => onChanged != null ? onChanged!(value) : {},
      keyboardType: inputType ?? TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide.none,
          //borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: blackDarkO40M14,
        labelText: "$text",
        labelStyle: blackDarkO40M14,
      ),
    );
  }
}

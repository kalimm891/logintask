import 'package:flutter/material.dart';
import 'package:test/theme/colors.dart';

class TextfieldPass extends StatefulWidget {
  final String? pass;
  final TextEditingController? control;

  TextfieldPass({
    Key? key,
    this.pass,
    this.control,
  }) : super(key: key);

  @override
  State<TextfieldPass> createState() => _TextfieldPassState();
}

class _TextfieldPassState extends State<TextfieldPass> {
  bool _obscureText = true;
  bool _loader = true;

  void _visible() {
    setState(() {
      _loader = !_loader;
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextFormField(
      cursorColor: Colors.white,
      obscureText: _obscureText,
      controller: widget.control,
      decoration:
       InputDecoration(
        hoverColor: AppColor.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: _loader
            ? GestureDetector(
                onTap: () {
                  _toggle();
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                ),
              )
            : GestureDetector(
                onTap: () {
                  _toggle();
                },
                child: Icon(Icons.visibility_off),
              ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.pass,
      ),
    ));
  }
}

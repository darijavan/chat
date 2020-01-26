import 'package:flutter/material.dart';
import 'package:mobile/src/constant/styles.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final bool obscureText;

  const CustomTextField(
    this.text, {
    this.obscureText = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  initState() {
    super.initState();

    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      obscureText: widget.obscureText && _obscureText,
      scrollPhysics: BouncingScrollPhysics(),
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: ChatStyles.hintStyle,
        suffixIcon: widget.obscureText
            ? Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: ChatStyles.hintStyle.color,
                    ),
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                  ),
                  !_obscureText
                      ? Icon(
                          Icons.close,
                          color: Colors.grey[800],
                          size: 34,
                        )
                      : SizedBox.shrink(),
                ],
              )
            : null,
      ),
    );
  }
}

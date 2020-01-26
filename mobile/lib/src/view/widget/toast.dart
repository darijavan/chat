import 'package:flutter/material.dart';
import 'package:mobile/src/constant/colors.dart';

class Toast {
  static const Duration LENGTH_SHORT = Duration(seconds: 1);
  static const Duration LENGTH_LONG = Duration(seconds: 5);

  static void show(
    BuildContext context,
    String message, {
    Duration duration,
    ToastGravity gravity = ToastGravity.bottom,
    Color color,
    Color textColor,
    TextStyle textStyle,
    double radius = 1000,
    Border border,
  }) {
    ToastView.dismiss();
    ToastView.createView(
      context,
      message,
      duration,
      gravity,
      color ?? ChatColors.toastColorDefault,
      textColor ?? Colors.white,
      textStyle,
      radius,
      border,
    );
  }
}

class ToastView {
  ToastView._privateConstructor();

  static final ToastView instance = ToastView._privateConstructor();

  static OverlayState _overlayState;
  static OverlayEntry _overlayEntry;

  static bool _isVisible = false;

  static void createView(
    BuildContext context,
    String message,
    Duration duration,
    ToastGravity gravity,
    Color color,
    Color textColor,
    TextStyle textStyle,
    double radius,
    Border border,
  ) async {
    _overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = color;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
        message: message,
        duration: duration,
        gravity: gravity,
        color: color,
        textColor: textColor,
        textStyle: textStyle,
        radius: radius,
        border: border,
      ),
    );

    _isVisible = true;
    _overlayState.insert(_overlayEntry);
    await Future.delayed(duration ?? Toast.LENGTH_SHORT);
    dismiss();
  }

  static void dismiss() async {
    if (!_isVisible) return;

    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  final String message;
  final Widget child;
  final ToastGravity gravity;
  final Duration duration;
  final Color color;
  final Color textColor;
  final TextStyle textStyle;
  final double radius;
  final Border border;

  ToastWidget({
    Key key,
    this.message,
    this.child,
    this.gravity = ToastGravity.bottom,
    this.duration = Toast.LENGTH_SHORT,
    this.color = Colors.black87,
    this.textColor = Colors.white,
    this.textStyle,
    this.radius = 1000,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Positioned(
      top: gravity == ToastGravity.top ? 20 : null,
      bottom: gravity == ToastGravity.bottom ? 20 : null,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          alignment: Alignment.center,
          child: child ??
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(radius),
                  border: border,
                ),
                child: Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle?.apply(
                        color: textColor,
                      ) ??
                      TextStyle(
                        color: textColor,
                      ),
                ),
              ),
        ),
      ),
    );
  }
}

enum ToastGravity {
  top,
  center,
  bottom,
}

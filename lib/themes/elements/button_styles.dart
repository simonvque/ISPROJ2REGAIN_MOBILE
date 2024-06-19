import 'package:flutter/material.dart';
import 'package:regain_mobile/constants/colors.dart';

enum ButtonType { outlined, filled, transparentOutlined, text }
enum ButtonSize { small, medium, large }

class RegainButtons extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final ButtonType type;
  final ButtonSize size;
  final IconData? leftIcon;
  final IconData? rightIcon;

  const RegainButtons({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.outlined,
    this.size = ButtonSize.medium,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyles = getButtonStyles(context);

    return SizedBox(
      width: buttonStyles['width'] as double?,
      height: buttonStyles['height'] as double?,
      child: buildButtonWidget(context, buttonStyles['style'] as ButtonStyle?),
    );
  }

  Widget buildButtonWidget(BuildContext context, ButtonStyle? style) {
    switch (type) {
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: buildButtonContent(),
        );
      case ButtonType.filled:
        return ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: buildButtonContent(),
        );
      case ButtonType.transparentOutlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: buildButtonContent(),
        );
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: style,
          child: buildButtonContent(),
        );
      default:
        return OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: buildButtonContent(),
        );
    }
  }

  Widget buildButtonContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leftIcon != null) Icon(leftIcon),
        if (leftIcon != null) const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        if (rightIcon != null) const Spacer(),
        if (rightIcon != null) Icon(rightIcon),
      ],
    );
  }

  Map<String, dynamic> getButtonStyles(BuildContext context) {
    double width;
    double height;
    ButtonStyle style;

    // Set button size
    switch (size) {
      case ButtonSize.small:
        width = MediaQuery.of(context).size.width * 0.45;
        height = MediaQuery.of(context).size.height * 0.055;
        break;
      case ButtonSize.medium:
        width = MediaQuery.of(context).size.width * 0.75;
        height = MediaQuery.of(context).size.height * 0.065;
        break;
      case ButtonSize.large:
        width = MediaQuery.of(context).size.width * 0.90;
        height = MediaQuery.of(context).size.height * 0.065;
        break;
    }

    // Set button style
    switch (type) {
      case ButtonType.outlined:
        style = OutlinedButton.styleFrom(
          foregroundColor: Colors.black87,
          side: const BorderSide(color: Colors.grey),
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        );
        break;
      case ButtonType.filled:
        style = FilledButton.styleFrom(
            backgroundColor: green,
            foregroundColor: white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))
        );
        break;
      case ButtonType.transparentOutlined:
        style = OutlinedButton.styleFrom(
            foregroundColor: Colors.black87,
            side: const BorderSide(color: Colors.transparent),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 0)
        ).copyWith(
          overlayColor:
          const WidgetStatePropertyAll(Colors.transparent),
        );
        break;
      case ButtonType.text:
        style = TextButton.styleFrom(
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
        break;
    }

    return {'width': width, 'height': height, 'style': style};
  }
}
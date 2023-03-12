import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
    this.size,
  }) : super(key: key);
  final String title;
  final Color? color;
  final double? size;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: color ?? Theme.of(context).primaryColor,
          fontSize: size ?? 14,
        ),
      ),
    );
  }
}

class CustomCupertinoIndicator extends StatelessWidget {
  final Brightness? brightness;

  const CustomCupertinoIndicator({this.brightness, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoTheme.of(context)
          .copyWith(brightness: brightness ?? Brightness.dark),
      child: const CupertinoActivityIndicator(),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  double? width;
  double? height;
  Color? color;
  Function onPressed;
  double? radius;
  Widget? icon;
  bool isDisabled;
  Color? textColor;
  Widget? widget;
  String title;
  double? textSize;

  PrimaryButton({
    Key? key,
    this.radius,
    this.width,
    this.icon,
    this.isDisabled = false,
    this.textColor,
    this.widget,
    this.color,
    this.height,
    this.textSize,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.0,
      child: ElevatedButton(
        onPressed:  () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: !isDisabled
              ? (color ?? Theme.of(context).primaryColor)
              : Colors.black45,
          elevation: 0,
          splashFactory: !isDisabled ? null : NoSplash.splashFactory,
          minimumSize: Size(width ?? double.infinity, height ?? 40.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
          ),
        ),
        child: widget ??
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: icon,
                  ),
                Text(title,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: textColor ?? Colors.white,
                          fontSize: textSize ?? 14,
                        ))
              ],
            ),
      ),
    );
  }
}

class PrimaryOutlinedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final double? radius;
  final Widget? widget;
  final String? title;
  final Color? titleColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final Color? iconColor;
  final double? iconSize;
  final double? textSize;

  PrimaryOutlinedButton(
      {Key? key,
      this.radius,
      this.width,
      this.iconSize,
      this.borderColor,
      this.widget,
      this.icon,
      this.textStyle,
      this.iconColor,
      this.height,
      this.titleColor,
      this.textSize,
      this.onPressed,
      this.title})
      : assert(title != null || widget != null,
            "Either loadingWidget or title is required"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: borderColor ?? Theme.of(context).primaryColor,
        elevation: 0,
        minimumSize: Size(width ?? double.infinity, height ?? 40.0),
        side: BorderSide(
          width: 1,
          color: onPressed == null
              ? Colors.grey
              : (borderColor ?? Theme.of(context).primaryColor),
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
        ),
      ),
      onPressed: onPressed,
      child: widget ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: iconSize ?? 15,
                    child: icon,
                  ),
                ),
             if(title!=null) Text(title!,
                  style:  textStyle ?? TextStyle(
                      color: onPressed == null
                          ? Colors.grey
                          : (borderColor ?? Theme.of(context).primaryColor),
                      fontSize: textSize)),
            ],
          ),
    );
  }
}


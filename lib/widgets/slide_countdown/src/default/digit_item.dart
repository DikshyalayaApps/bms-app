part of 'default.dart';

class DigitItem extends BaseDigits {
  const DigitItem({
    Key? key,
    required ValueNotifier<int> firstDigit,
    required ValueNotifier<int> secondDigit,
    required TextStyle textStyle,
    required TextStyle separatorStyle,
    required SlideDirection slideDirection,
    required Curve curve,
    required bool countUp,
    required Duration slideAnimationDuration,
    required String separator,
    required bool fade,
    bool? showSeparator,
    EdgeInsets? separatorPadding,
    EdgeInsets? textPadding,
    EdgeInsets? textMargin,
    TextDirection? textDirection,
    Decoration? textDecoration,
    List<String>? digitsNumber,
  }) : super(
          key: key,
          firstDigit: firstDigit,
          secondDigit: secondDigit,
          textStyle: textStyle,
          separatorStyle: separatorStyle,
          slideDirection: slideDirection,
          textPadding: textPadding,
          textMargin: textMargin,
          textDecoration: textDecoration,
          curve: curve,
          countUp: countUp,
          slideAnimationDuration: slideAnimationDuration,
          separator: separator,
          fade: fade,
          showSeparator: showSeparator ?? true,
          separatorPadding: separatorPadding,
          textDirection: textDirection,
          digitsNumber: digitsNumber,
        );

  @override
  Widget build(BuildContext context) {
    final withOutAnimation = slideDirection == SlideDirection.none;
    final firstDigitWidget = withOutAnimation
        ? TextWithoutAnimation(
            value: firstDigit,
            textStyle: textStyle,
            digitsNumber: digitsNumber,
          )
        : TextAnimation(
            slideAnimationDuration: slideAnimationDuration,
            value: firstDigit,
            textStyle: textStyle,
            slideDirection: slideDirection,
            curve: curve,
            countUp: countUp,
            fade: fade,
            textMargin: textMargin,
            textPadding: textPadding,
            textDecoration: textDecoration,
            digitsNumber: digitsNumber,
          );

    final secondDigitWidget = withOutAnimation
        ? TextWithoutAnimation(
            value: secondDigit,
            textStyle: textStyle,
            digitsNumber: digitsNumber,
          )
        : TextAnimation(
            slideAnimationDuration: slideAnimationDuration,
            value: secondDigit,
            textStyle: textStyle,
            slideDirection: slideDirection,
            curve: curve,
            textMargin: textMargin,
            textPadding: textPadding,
            textDecoration: textDecoration,
            countUp: countUp,
            fade: fade,
            digitsNumber: digitsNumber,
          );

    final separatorWidget = Separator(
      padding: separatorPadding,
      show: showSeparator,
      separator: separator,
      style: separatorStyle,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (textDirection.isRtl)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              separatorWidget,
              Container(
                margin: textMargin,
                padding: textPadding,
                decoration: textDecoration,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    secondDigitWidget,
                    firstDigitWidget,
                  ],
                ),
              ),
            ],
          )
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: textMargin,
                padding: textPadding,
                decoration: textDecoration,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    firstDigitWidget,
                    secondDigitWidget,
                  ],
                ),
              ),
              separatorWidget,
            ],
          )
      ],
    );
  }
}

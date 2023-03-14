import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PrimaryTextField extends HookWidget {
  final String? hintTxt;
  final String? initialValue;
  final String? keyName;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final int? maxLength;
  final int? maxLine;
  final String? label;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? innerIcon;
  final double? borderRadius;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool? isReadOnly;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final bool enableBorder;
  final Color? fillColor;
  final TextEditingController? controller;
  final double? labelHeight;
  final bool enable;
  final EdgeInsets? contentPadding;

  // final Function onSaved;

  const PrimaryTextField(
      {super.key,
      this.enable = true,
      required this.onSaved,
      this.innerIcon,
      this.label,
      this.maxLine,
      this.validator,
      this.initialValue,
      this.borderRadius,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.contentPadding,
      this.hintTxt,
      this.keyName,
      this.controller,
      this.fillColor,
      this.labelHeight,
      this.enableBorder = false,
      this.isReadOnly,
      this.isPassword = false,
      this.textInputType,
      this.maxLength,
      this.fieldKey});

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(isPassword);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: prefixIcon,
                ),
              Text(
                '$label',
              ),
            ],
          ),
        if (label != null)
          SizedBox(
            height: labelHeight ?? 10,
          ),
        Container(
          alignment: Alignment.centerLeft,
          child: FormBuilderTextField(
            controller: controller,
            enabled: enable,
            key: fieldKey,
            initialValue: initialValue,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: isPasswordVisible.value,
            style: Theme.of(context).textTheme.bodyLarge,
            readOnly: isReadOnly ?? false,
            // enabled: isTextFieldEnabled??true,
            decoration: InputDecoration(
              prefixIcon: innerIcon,
              fillColor: fillColor,
              isDense: true,
              errorText: errorText,
              counterText: "",
              errorMaxLines: 2,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 10.0),
              // labelText:
              hintText: hintTxt ?? "",
              // hintStyle:Theme.of(context).textTheme.bodyText1 ,
              // "Email or Phone",
              // labelStyle: AppTextStyle.textboxtext,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                    color: enableBorder
                        ? Theme.of(context).primaryColor
                        : Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                  color: enableBorder
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                  color: enableBorder
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
                borderSide: BorderSide(
                    color: enableBorder
                        ? Theme.of(context).primaryColor
                        : Colors.transparent),
              ),
              suffixIcon: isPassword
                  ? GestureDetector(
                      onTap: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Icon(isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ))
                  : Container(
                      padding: const EdgeInsets.all(15),
                      child: suffixIcon ?? const Text('')),
            ),
            onSaved: onSaved,
            maxLines: maxLine ?? 1,
            maxLength: maxLength,
            validator: validator,
            name: keyName ?? "null",
          ),
        ),
      ],
    );
  }
}

class PrimaryRadioButton extends HookWidget {
  final String? initialValue;
  final List<FormBuilderFieldOption> options;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final ValueChanged onChanged;
  final TextInputType? textInputType;
  final int? maxLength;
  final String label;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final IconData? prefixIcon;
  final double? borderRadius;
  final double? labelHeight;

  // final Function onSaved;

  const PrimaryRadioButton(
      {super.key,
      required this.options,
      required this.label,
      required this.validator,
      this.initialValue,
      required this.onSaved,
      required this.onChanged,
      this.borderRadius,
      this.prefixIcon,
      this.labelHeight,
      this.textInputType,
      this.maxLength,
      this.fieldKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  prefixIcon,
                ),
              ),
            Text(
              label,
            ),
          ],
        ),
        SizedBox(
          height: labelHeight ?? 10,
        ),
        FormBuilderRadioGroup(
          key: fieldKey,
          initialValue: initialValue,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
          ),
          //border: InputBorder.none
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          options: options,
          name: label,
        ),
      ],
    );
  }
}

class PrimaryDropDownField extends HookWidget {
  final String hintTxt;
  final String? initialValue;
  final List<DropdownMenuItem<String>> items;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?> onChanged;
  final TextInputType? textInputType;
  final int? maxLength;
  final String? label;
  final GlobalKey<FormBuilderFieldState>? fieldKey;
  final IconData? prefixIcon;
  final double? borderRadius;
  final double? labelHeight;

  // final Function onSaved;

  const PrimaryDropDownField(
      {super.key,
      required this.items,
      this.label,
      this.validator,
      this.initialValue,
      required this.onSaved,
      required this.onChanged,
      this.borderRadius,
      this.prefixIcon,
      required this.hintTxt,
      this.labelHeight,
      this.textInputType,
      this.maxLength,
      this.fieldKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  prefixIcon,
                ),
              ),
            if (label != null)
              Text(
                label!,
              ),
          ],
        ),
        SizedBox(
          height: labelHeight ?? 10,
        ),
        FormBuilderDropdown<String>(
          key: fieldKey,
          initialValue: initialValue,
          style: Theme.of(context).textTheme.bodyLarge,
          name: '',
          isExpanded: true,
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            hintText: hintTxt,
            isDense: true,
            errorMaxLines: 2,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            filled: true,
            errorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 5.0)),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
          // initialValue: 'Male',
          onSaved: onSaved,
          isDense: true,
          onChanged: onChanged,
          validator: validator,
          items: items,
        ),
      ],
    );
  }
}

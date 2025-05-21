import 'package:flutter/material.dart';
import '../models/district_model.dart';

class DistrictDropdown extends StatelessWidget {
  final List<DistrictModel> districts;
  final DistrictModel? selectedDistrict;
  final ValueChanged<DistrictModel?> onChanged;

  // DropdownButton parametreleri
  final Widget? hint;
  final Widget? disabledHint;
  final double? iconSize;
  final TextStyle? style;
  final bool isExpanded;
  final Widget? icon;
  final Color? dropdownColor;
  final InputDecoration? decoration; // (Bu genelde TextField içindir, dropdown'da BoxDecoration kullanacağız)
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Widget? underline;
  final AlignmentGeometry alignment;
  final bool? enableFeedback;
  final FocusNode? focusNode;
  final bool autofocus;
  final EdgeInsetsGeometry? padding;

  final BoxDecoration? boxDecoration; // **Yeni eklendi**

  const DistrictDropdown({
    super.key,
    required this.districts,
    required this.selectedDistrict,
    required this.onChanged,
    this.hint,
    this.disabledHint,
    this.iconSize,
    this.style,
    this.isExpanded = true,
    this.icon,
    this.dropdownColor,
    this.decoration,
    this.borderRadius,
    this.width,
    this.height,
    this.underline,
    this.alignment = AlignmentDirectional.centerStart,
    this.enableFeedback,
    this.focusNode,
    this.autofocus = false,
    this.padding,
    this.boxDecoration, // **Yeni eklendi**
  });

  @override
  Widget build(BuildContext context) {
    final dropdown = DropdownButton<DistrictModel>(
      value: selectedDistrict,
      items: districts.map((district) {
        return DropdownMenuItem<DistrictModel>(
          value: district,
          child: Text(district.name, style: style),
        );
      }).toList(),
      onChanged: onChanged,
      hint: hint,
      disabledHint: disabledHint,
      iconSize: iconSize ?? 24,
      isExpanded: isExpanded,
      style: style,
      icon: icon,
      dropdownColor: dropdownColor,
      underline: underline,
      borderRadius: borderRadius,
      alignment: alignment,
      enableFeedback: enableFeedback,
      focusNode: focusNode,
      autofocus: autofocus,
    );

    if (isExpanded) {
      return Container(
        padding: padding,
        decoration: boxDecoration,
        child: dropdown,
      );
    }

    return Container(
      width: width ?? 200,
      height: height ?? 50,
      padding: padding,
      decoration: boxDecoration,
      child: dropdown,
    );
  }
}

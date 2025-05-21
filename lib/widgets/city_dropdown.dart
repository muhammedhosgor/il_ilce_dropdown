import 'package:flutter/material.dart';
import '../models/city_model.dart';

class CityDropdown extends StatelessWidget {
  final List<CityModel> citys;
  final CityModel? selectedCity;
  final ValueChanged<CityModel?> onChanged;

  final Widget? hint;
  final Widget? disabledHint;
  final double? iconSize;
  final TextStyle? style;
  final bool isExpanded;

  final double? dropdownWidth;
  final double? dropdownHeight;

  final Widget? icon;
  final Color? dropdownColor;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;

  final BoxDecoration? boxDecoration;

  const CityDropdown({
    super.key,
    required this.citys,
    required this.selectedCity,
    required this.onChanged,
    this.hint,
    this.disabledHint,
    this.iconSize,
    this.style,
    this.isExpanded = true,
    this.dropdownWidth,
    this.dropdownHeight,
    this.icon,
    this.dropdownColor,
    this.padding,
    this.alignment = Alignment.centerLeft,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final dropdown = DropdownButton<CityModel>(
      value: selectedCity,
      items: citys
          .map((city) => DropdownMenuItem<CityModel>(
                value: city,
                child: Text(city.name, style: style),
              ))
          .toList(),
      onChanged: onChanged,
      hint: hint,
      disabledHint: disabledHint,
      iconSize: iconSize ?? 24,
      isExpanded: isExpanded,
      style: style,
      icon: icon,
      dropdownColor: dropdownColor,
      alignment: alignment,
    );

    // 🔻 Eğer genişletilmiş değilse özel ölçü uygulanacak
    if (!isExpanded) {
      return Container(
        width: dropdownWidth ?? 150,
        height: dropdownHeight ?? 50,
        padding: padding ?? EdgeInsets.zero,
        decoration: boxDecoration, // ✅ BoxDecoration uygula
        child: dropdown,
      );
    }

    // 🔻 Genişletilmişse bile container ile decoration uygulanabilsin
    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: boxDecoration, // ✅ BoxDecoration uygula
      child: dropdown,
    );
  }
}

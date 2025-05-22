import 'package:flutter/material.dart';
import '../models/city_model.dart';

/// A reusable dropdown widget to select a city.
/// This widget provides extensive customization options including styles, decoration, and alignment.
class CityDropdown extends StatelessWidget {
  /// [citys] is a list of cities to be displayed in the dropdown.
  final List<CityModel> citys;

  /// [selectedCity] is the currently selected city.
  final CityModel? selectedCity;

  /// [onChanged] is a callback function that is triggered when the selected city changes.
  final ValueChanged<CityModel?> onChanged;

  /// [hint] is the widget displayed when no city is selected.
  final Widget? hint;

  /// [disabledHint] is the widget displayed when the dropdown is disabled.
  final Widget? disabledHint;

  /// [iconSize] is the size of the dropdown icon.
  final double? iconSize;

  /// [style] is the text style applied to the dropdown items.
  final TextStyle? style;

  /// [isExpanded] determines if the dropdown should take the full width of its parent.
  final bool isExpanded;

  /// Custom width for the dropdown (applied only when [isExpanded] is false).
  final double? dropdownWidth;

  /// Custom height for the dropdown (applied only when [isExpanded] is false).
  final double? dropdownHeight;

  ///  [icon] is the icon displayed in the dropdown.
  final Widget? icon;

  /// [dropdownColor] is the background color of the dropdown.
  final Color? dropdownColor;

  /// [padding] is the padding applied to the dropdown container.
  final EdgeInsetsGeometry? padding;

  /// Alignment of the dropdown content.
  final AlignmentGeometry alignment;

  /// [boxDecoration] is the decoration applied to the dropdown container.
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
    // DropdownButton widget configuration
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

    // 🔻 If not expanded, apply fixed width/height and decoration
    if (!isExpanded) {
      return Container(
        width: dropdownWidth ?? 150,
        height: dropdownHeight ?? 50,
        padding: padding ?? EdgeInsets.zero,
        decoration: boxDecoration,
        child: dropdown,
      );
    }

    // 🔻 If expanded, still apply optional padding and decoration
    return Container(
      padding: padding ?? EdgeInsets.zero,
      decoration: boxDecoration,
      child: dropdown,
    );
  }
}

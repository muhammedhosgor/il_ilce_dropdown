import 'package:flutter/material.dart';
import '../models/district_model.dart';

/// A customizable dropdown widget to select a district.
/// Provides fine-grained control over layout, styling, and behavior.
class DistrictDropdown extends StatelessWidget {
  /// [districts] is a list of districts to be displayed in the dropdown.
  final List<DistrictModel> districts;

  /// [selectedDistrict] is the currently selected district.
  final DistrictModel? selectedDistrict;

  /// [onChanged] is a callback function that is triggered when the selected district changes.
  final ValueChanged<DistrictModel?> onChanged;

  /// [hint] is the widget displayed when no district is selected.
  final Widget? hint;

  /// [disabledHint] is the widget displayed when the dropdown is disabled.
  final Widget? disabledHint;

  /// [iconSize] is the size of the dropdown icon.
  final double? iconSize;

  ///  [style] is the text style applied to the dropdown items.
  final TextStyle? style;

  /// [isExpanded] determines if the dropdown should take the full width of its parent.
  final bool isExpanded;

  ///[icon] is the icon displayed in the dropdown.
  final Widget? icon;

  /// [dropdownColor] is the background color of the dropdown.
  final Color? dropdownColor;

  /// [decoration] is the decoration applied to the dropdown container.
  final InputDecoration? decoration;

  /// [borderRadius] is the border radius applied to the dropdown container.
  final BorderRadius? borderRadius;

  /// Fixed width for the dropdown (used when [isExpanded] is false).
  final double? width;

  /// Fixed height for the dropdown (used when [isExpanded] is false).
  final double? height;

  /// [underline] is the widget displayed below the dropdown.
  final Widget? underline;

  /// [alignment] is the alignment of the dropdown content.
  final AlignmentGeometry alignment;

  /// [enableFeedback] determines if the dropdown should provide haptic feedback on selection.
  final bool? enableFeedback;

  /// [focusNode] is the focus node for the dropdown.
  final FocusNode? focusNode;

  /// [autofocus] determines if the dropdown should gain focus automatically.
  final bool autofocus;

  /// [padding] is the padding applied to the dropdown container.
  final EdgeInsetsGeometry? padding;

  /// [boxDecoration] is the decoration applied to the dropdown container.
  final BoxDecoration? boxDecoration;

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
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    // Core DropdownButton widget with all configurations
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

    // 🔻 Apply styling if the dropdown is expanded (takes full width)
    if (isExpanded) {
      return Container(
        padding: padding,
        decoration: boxDecoration, // ✅ Custom box decoration (e.g., border, color)
        child: dropdown,
      );
    }

    // 🔻 Apply fixed dimensions if the dropdown is not expanded
    return Container(
      width: width ?? 200,
      height: height ?? 50,
      padding: padding,
      decoration: boxDecoration, // ✅ Custom box decoration
      child: dropdown,
    );
  }
}

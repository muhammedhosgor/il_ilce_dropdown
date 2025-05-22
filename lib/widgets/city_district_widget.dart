import 'package:flutter/material.dart';
import '../models/city_model.dart';
import '../models/district_model.dart';
import 'city_dropdown.dart';
import 'district_dropdown.dart';

/// A widget that displays two dependent dropdowns:
/// one for selecting a city and one for selecting a district based on the selected city.
class CityDistrictDropdown extends StatefulWidget {
  final void Function(CityModel city, DistrictModel district)? onChanged;

  // --- City dropdown customization props ---
  final Widget? cityHint;

  /// [cityHint] is the hint text for the city dropdown.
  final Widget? cityDisabledHint;

  /// [cityDisabledHint] is the hint text for the city dropdown when it is disabled.
  final TextStyle? cityStyle;

  /// [cityStyle] is the text style for the city dropdown.
  final double? cityIconSize;

  /// [cityIconSize] is the size of the icon in the city dropdown.
  final bool cityIsExpanded;

  /// [cityIsExpanded] determines if the city dropdown is expanded.
  final double? cityDropdownWidth;

  /// [cityDropdownWidth] is the width of the city dropdown.
  final double? cityDropdownHeight;

  /// [cityDropdownHeight] is the height of the city dropdown.
  final Widget? cityIcon;

  /// [cityIcon] is the icon displayed in the city dropdown.
  final Color? cityDropdownColor;

  /// [cityDropdownColor] is the background color of the city dropdown.
  final EdgeInsetsGeometry? cityPadding;

  /// [cityPadding] is the padding for the city dropdown.
  final AlignmentGeometry cityAlignment;

  /// [cityAlignment] is the alignment of the city dropdown.
  final BoxDecoration? cityBoxDecoration;

  /// [cityBoxDecoration] is the decoration applied to the city dropdown.

  // --- District dropdown customization props ---
  final Widget? districtHint;

  /// [districtHint] is the hint text for the district dropdown.
  final Widget? districtDisabledHint;

  /// [districtDisabledHint] is the hint text for the district dropdown when it is disabled.
  final TextStyle? districtStyle;

  /// [districtStyle] is the text style for the district dropdown.
  final double? districtIconSize;

  /// [districtIconSize] is the size of the icon in the district dropdown.
  final bool districtIsExpanded;

  /// [districtIsExpanded] determines if the district dropdown is expanded.
  final double? districtDropdownWidth;

  /// [districtDropdownWidth] is the width of the district dropdown.
  final double? districtDropdownHeight;

  /// [districtDropdownHeight] is the height of the district dropdown.
  final Widget? districtIcon;

  /// [districtIcon] is the icon displayed in the district dropdown.
  final Color? districtDropdownColor;

  /// [districtDropdownColor] is the background color of the district dropdown.
  final EdgeInsetsGeometry? districtPadding;

  /// [districtPadding] is the padding for the district dropdown.
  final AlignmentGeometry districtAlignment;

  /// [districtAlignment] is the alignment of the district dropdown.
  final BoxDecoration? districtBoxDecoration;

  /// [districtBoxDecoration] is the decoration applied to the district dropdown.

  final double? spacerHeight;

  /// [spacerHeight] is the height of the space between the two dropdowns.

  const CityDistrictDropdown({
    super.key,
    this.onChanged,
    this.cityHint,
    this.cityDisabledHint,
    this.cityStyle,
    this.cityIconSize,
    this.cityIsExpanded = true,
    this.cityDropdownWidth,
    this.cityDropdownHeight,
    this.cityIcon,
    this.cityDropdownColor,
    this.cityPadding,
    this.cityAlignment = Alignment.centerLeft,
    this.cityBoxDecoration,
    this.districtHint,
    this.districtDisabledHint,
    this.districtStyle,
    this.districtIconSize,
    this.districtIsExpanded = true,
    this.districtDropdownWidth,
    this.districtDropdownHeight,
    this.districtIcon,
    this.districtDropdownColor,
    this.districtPadding,
    this.districtAlignment = Alignment.centerLeft,
    this.districtBoxDecoration,
    this.spacerHeight,
  });

  @override
  State<CityDistrictDropdown> createState() => _CityDistrictDropdownState();
}

class _CityDistrictDropdownState extends State<CityDistrictDropdown> {
  late List<CityModel> citys; // Full city list
  late List<DistrictModel> districts; // Full district list

  CityModel? selectedCity; // Currently selected city
  DistrictModel? selectedDistrict; // Currently selected district

  @override
  void initState() {
    super.initState();
    citys = cityList;
    districts = districtList;

    // Default selected city (e.g., with id "0" as placeholder)
    selectedCity = citys.firstWhere((city) => city.id == "0");
  }

  @override
  Widget build(BuildContext context) {
    // Filter districts by selected city
    final selectedProvinceDistricts = districts.where((district) => district.city_id == selectedCity?.id).toList();

    return Column(
      children: [
        // --- City Dropdown ---
        CityDropdown(
          citys: citys,
          selectedCity: selectedCity,
          onChanged: (CityModel? city) {
            setState(() {
              selectedCity = city;
              selectedDistrict = null; // Reset district when city changes
            });
          },
          hint: widget.cityHint,
          disabledHint: widget.cityDisabledHint,
          style: widget.cityStyle,
          iconSize: widget.cityIconSize,
          isExpanded: widget.cityIsExpanded,
          dropdownWidth: widget.cityDropdownWidth,
          dropdownHeight: widget.cityDropdownHeight,
          icon: widget.cityIcon,
          dropdownColor: widget.cityDropdownColor,
          padding: widget.cityPadding,
          alignment: widget.cityAlignment,
          boxDecoration: widget.cityBoxDecoration,
        ),

        // Spacer between dropdowns
        SizedBox(
          height: widget.spacerHeight ?? 0,
        ),

        // --- District Dropdown ---
        if (selectedCity != null && selectedCity!.id != "0")
          DistrictDropdown(
            districts: selectedProvinceDistricts,
            selectedDistrict: selectedDistrict,
            onChanged: (DistrictModel? district) {
              setState(() {
                selectedDistrict = district;

                // Callback when both city and district are selected
                if (widget.onChanged != null && selectedCity != null && district != null) {
                  widget.onChanged!(selectedCity!, district);
                }
              });
            },
            hint: widget.districtHint,
            disabledHint: widget.districtDisabledHint,
            style: widget.districtStyle,
            iconSize: widget.districtIconSize,
            isExpanded: widget.districtIsExpanded,
            // dropdownWidth: widget.districtDropdownWidth, // Optional
            // dropdownHeight: widget.districtDropdownHeight, // Optional
            icon: widget.districtIcon,
            dropdownColor: widget.districtDropdownColor,
            padding: widget.districtPadding,
            alignment: widget.districtAlignment,
            boxDecoration: widget.districtBoxDecoration, // Decoration applied
          ),
      ],
    );
  }
}

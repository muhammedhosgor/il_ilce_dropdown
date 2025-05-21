import 'package:flutter/material.dart';
import '../models/city_model.dart';
import '../models/district_model.dart';
import 'city_dropdown.dart';
import 'district_dropdown.dart';

class CityDistrictDropdown extends StatefulWidget {
  final void Function(CityModel city, DistrictModel district)? onChanged;

  // İl props
  final Widget? cityHint;
  final Widget? cityDisabledHint;
  final TextStyle? cityStyle;
  final double? cityIconSize;
  final bool cityIsExpanded;
  final double? cityDropdownWidth;
  final double? cityDropdownHeight;
  final Widget? cityIcon;
  final Color? cityDropdownColor;
  final EdgeInsetsGeometry? cityPadding;
  final AlignmentGeometry cityAlignment;

  final BoxDecoration? cityBoxDecoration;

  // İlçe props
  final Widget? districtHint;
  final Widget? districtDisabledHint;
  final TextStyle? districtStyle;
  final double? districtIconSize;
  final bool districtIsExpanded;
  final double? districtDropdownWidth;
  final double? districtDropdownHeight;
  final Widget? districtIcon;
  final Color? districtDropdownColor;
  final EdgeInsetsGeometry? districtPadding;
  final AlignmentGeometry districtAlignment;

  final BoxDecoration? districtBoxDecoration;
  final double? spacerHeight;

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
  late List<CityModel> citys;
  late List<DistrictModel> districts;

  CityModel? selectedCity;
  DistrictModel? selectedDistrict;

  @override
  void initState() {
    super.initState();
    citys = cityList;
    districts = districtList;
    selectedCity = citys.firstWhere((city) => city.id == "0");
  }

  @override
  Widget build(BuildContext context) {
    final selectedProvinceDistricts = districts.where((district) => district.il_id == selectedCity?.id).toList();

    return Column(
      children: [
        CityDropdown(
          citys: citys,
          selectedCity: selectedCity,
          onChanged: (CityModel? city) {
            setState(() {
              selectedCity = city;
              selectedDistrict = null;
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
        SizedBox(
          height: widget.spacerHeight ?? 0,
        ),
        if (selectedCity != null && selectedCity!.id != "0")
          DistrictDropdown(
            districts: selectedProvinceDistricts,
            selectedDistrict: selectedDistrict,
            onChanged: (DistrictModel? district) {
              setState(() {
                selectedDistrict = district;
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
            // dropdownWidth: widget.districtDropdownWidth,
            // dropdownHeight: widget.districtDropdownHeight,
            icon: widget.districtIcon,
            dropdownColor: widget.districtDropdownColor,
            padding: widget.districtPadding,
            alignment: widget.districtAlignment,
            boxDecoration: widget.districtBoxDecoration, // **Eklendi**
          ),
      ],
    );
  }
}

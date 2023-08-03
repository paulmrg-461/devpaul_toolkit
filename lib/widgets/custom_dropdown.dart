import 'package:devpaul_toolkit/config/themes/custom_light_theme.dart';
import 'package:flutter/material.dart';

typedef StringCallback = void Function(String val);

class CustomDropdown extends StatefulWidget {
  final StringCallback? action;
  final String hintText;
  final List<String> optionList;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final bool? hasTrailing;
  const CustomDropdown(
      {Key? key,
      required this.hintText,
      required this.optionList,
      required this.icon,
      this.iconColor = CustomLightTheme.primaryColor,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black54,
      required this.action,
      required this.width,
      this.hasTrailing = false})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

String selectedValue = '';

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.optionList.isNotEmpty ? widget.optionList[0] : 'Select';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black45, width: 1.2),
              color: widget.backgroundColor
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //       color: Colors.black.withOpacity(0.05),
              //       offset: const Offset(0, 5),
              //       blurRadius: 5)
              // ]
              ),
          margin: const EdgeInsets.only(bottom: 16, top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(widget.icon, color: widget.iconColor),
              ),
              Expanded(
                child: DropdownButton<String>(
                    hint: Text(
                      widget.hintText,
                      style: TextStyle(
                          color: widget.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    isExpanded: true,
                    dropdownColor: widget.backgroundColor,
                    style: TextStyle(
                        color: widget.textColor!,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    underline: Container(),
                    value: selectedValue,
                    items: widget.optionList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: widget.textColor!,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      widget.action!(value!);
                      setState(() {
                        selectedValue = value;
                      });
                    }),
              ),
            ],
          ),
        ),
        Positioned(
            left: 0,
            top: -2,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(right: 6),
              child: Text(
                widget.hintText,
                style: TextStyle(fontSize: 11, color: widget.textColor),
              ),
            ))
      ],
    );
  }
}

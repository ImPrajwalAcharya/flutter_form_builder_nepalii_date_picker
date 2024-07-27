import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as nepali;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class FormBuilderNepaliDatePicker extends StatefulWidget {
  final String name;
  final DatePickerEntryMode? initialEntryMode;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final TextStyle? style;
  final TextEditingController? controller;
  final DatePickerMode? initialDatePickerMode;
  final Locale? locale;
  final NepaliDateTime? initialValue;
  final InputDecoration? decoration;
  final ValueChanged? onChanged;
  final AutovalidateMode? autovalidateMode;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final NepaliDateTime? firstDate;
  final NepaliDateTime? lastDate;
  final String? formater;
  final bool Function(NepaliDateTime)? selectableDayPredicate;
  const FormBuilderNepaliDatePicker(
      {super.key,
      required this.name,
      this.initialValue,
      this.decoration,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.firstDate,
      this.lastDate,
      this.formater,
      this.selectableDayPredicate,
      this.initialEntryMode,
      this.helpText,
      this.cancelText,
      this.confirmText,
      this.initialDatePickerMode,
      this.locale,
      this.controller,
      this.autovalidateMode,
      this.style});

  @override
  State<FormBuilderNepaliDatePicker> createState() =>
      _FormBuilderNepaliDatePickerState();
}

class _FormBuilderNepaliDatePickerState
    extends State<FormBuilderNepaliDatePicker> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller = widget.controller ?? controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      onChanged: widget.onChanged,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      onTap: () async {
        final date = await nepali.showMaterialDatePicker(
          initialEntryMode:
              widget.initialEntryMode ?? DatePickerEntryMode.calendar,
          helpText: widget.helpText,
          locale: widget.locale,
          cancelText: widget.cancelText,
          confirmText: widget.confirmText,
          initialDatePickerMode: DatePickerMode.day,
          context: context,
          initialDate: widget.initialValue ?? nepali.NepaliDateTime.now(),
          firstDate: widget.firstDate ?? nepali.NepaliDateTime(1990),
          lastDate: widget.lastDate ?? nepali.NepaliDateTime(2090),
          selectableDayPredicate: widget.selectableDayPredicate,
        );

        if (date != null) {
          setState(() {
            controller.text =
                nepali.NepaliDateFormat(widget.formater ?? "yyyy-MM-dd")
                    .format(date)
                    .toString();
          });
        }
        setState(() {});
      },
      style: widget.style ?? TextStyle(color: Colors.black),
      validator: widget.validator,
      controller: controller,
      decoration: widget.decoration ?? InputDecoration(),
      readOnly: true,
      name: widget.name,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as nepali;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class FormBuilderNepaliDatePicker extends StatefulWidget {
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
      this.formater = 'yyyy-MM-dd',
      this.selectableDayPredicate,
      this.initialEntryMode = DatePickerEntryMode.calendar,
      this.helpText,
      this.cancelText,
      this.confirmText,
      this.initialDatePickerMode = DatePickerMode.day,
      this.locale,
      this.controller,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.style});

  /// The name of the field.
  final String name;

  /// The initialEntryMode for the date picker.
  /// Defaults to DatePickerEntryMode.calendar.
  final DatePickerEntryMode initialEntryMode;

  /// The help text to be displayed on the date picker.
  final String? helpText;

  /// The cancel text to be displayed on the date picker.
  final String? cancelText;

  /// The confirm text to be displayed on the date picker.
  final String? confirmText;

  /// The style to be applied on the text field.
  final TextStyle? style;

  /// The controller to be used for the text field.
  final TextEditingController? controller;

  /// The initialDatePickerMode for the date picker.
  /// Defaults to DatePickerMode.day.
  final DatePickerMode initialDatePickerMode;

  /// The locale for the date picker.
  final Locale? locale;

  /// The initial value of the field.
  final NepaliDateTime? initialValue;

  /// The decoration to be applied on the text field.
  final InputDecoration? decoration;

  /// The function to be called when the value of the field changes.
  final ValueChanged? onChanged;

  /// The autovalidate mode for the field.
  /// Defaults to AutovalidateMode.onUserInteraction.
  final AutovalidateMode autovalidateMode;

  /// The function to be called when the field is saved.
  final FormFieldSetter? onSaved;

  /// The function to be called for validation.
  final FormFieldValidator? validator;

  /// The first date for the date picker.
  final NepaliDateTime? firstDate;

  /// The last date for the date picker.
  final NepaliDateTime? lastDate;

  /// The formater for the date.
  /// Defaults to 'yyyy-MM-dd'.
  final String formater;

  /// The selectable day predicate for the date picker.
  final bool Function(NepaliDateTime)? selectableDayPredicate;

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
      autovalidateMode: widget.autovalidateMode,
      onTap: () async {
        final date = await nepali.showMaterialDatePicker(
          initialEntryMode: widget.initialEntryMode,
          helpText: widget.helpText,
          locale: widget.locale,
          cancelText: widget.cancelText,
          confirmText: widget.confirmText,
          initialDatePickerMode: widget.initialDatePickerMode,
          context: context,
          initialDate: widget.initialValue ?? nepali.NepaliDateTime.now(),
          firstDate: widget.firstDate ?? nepali.NepaliDateTime(1990),
          lastDate: widget.lastDate ?? nepali.NepaliDateTime(2090),
          selectableDayPredicate: widget.selectableDayPredicate,
        );

        if (date != null) {
          setState(() {
            controller.text = nepali.NepaliDateFormat(widget.formater)
                .format(date)
                .toString();
          });
        }
        setState(() {});
      },
      style: widget.style,
      validator: widget.validator,
      controller: controller,
      decoration: widget.decoration ?? const InputDecoration(),
      readOnly: true,
      name: widget.name,
    );
  }
}

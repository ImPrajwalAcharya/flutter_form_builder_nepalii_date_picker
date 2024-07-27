<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


# Nepali Date Picker for FormBuilder

A custom Nepali Date Picker widget for Flutter applications, integrated with FormBuilder, supporting the Bikram Sambat (BS) calendar. This package allows seamless selection and conversion of dates in the Nepali calendar system.

## Features

- Supports Bikram Sambat (BS) calendar date selection.
- Integration with FormBuilder as `FormBuilderNepaliDatePicker`.
- AD to BS and BS to AD date conversion.
- Dropdown selection for year, month, and day in BS format.
- Options to disable past and future dates.
- Minimum and maximum date constraints.
- Customizable date formats.
- Basic styling and theming capabilities.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  nepali_date_picker: ^0.1.0



## Usage


```dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_form_builder_nepali_date_picker/flutter_form_builder_nepali_date_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Flutter App'),
        ),
        body: FormBuilder(
          key: _fbKey,
          child: Column(children: <Widget>[
            FormBuilderNepaliDatePicker(
              style: TextStyle(color: Colors.black, fontSize: 20),
              name: 'date',
              decoration: InputDecoration(labelText: 'Date'),
            ),
            FormBuilderTextField(
              name: 'name',
              decoration: InputDecoration(labelText: 'Name'),
            ),
            FormBuilderTextField(
              name: 'email',
              decoration: InputDecoration(labelText: 'Email'),
            ),
            FormBuilderTextField(
              name: 'password',
              decoration: InputDecoration(labelText: 'Password'),
            ),
            FormBuilderCheckbox(
              name: 'accept_terms',
              title: Text('Accept Terms'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_fbKey.currentState!.saveAndValidate()) {
                    print(_fbKey.currentState!.value);
                  }
                },
                child: Text('Submit'))
          ]),
        ),
      ),
    );
  }
}


```



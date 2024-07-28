import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_form_builder_nepali_date_picker/flutter_form_builder_nepali_date_picker.dart';

void main() {
  runApp(const MyApp());
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
          title: const Text('My First Flutter App'),
        ),
        body: FormBuilder(
          key: _fbKey,
          child: Column(children: <Widget>[
            const FormBuilderNepaliDatePicker(
              style: TextStyle(color: Colors.black, fontSize: 20),
              name: 'date',
              decoration: InputDecoration(labelText: 'Date'),
            ),
            FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            FormBuilderCheckbox(
              name: 'accept_terms',
              title: const Text('Accept Terms'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_fbKey.currentState!.saveAndValidate()) {
                    print(_fbKey.currentState!.value);
                  }
                },
                child: const Text('Submit'))
          ]),
        ),
      ),
    );
  }
}
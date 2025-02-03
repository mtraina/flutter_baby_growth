import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Baby Growth';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const BabyGrowthForm(),
      ),
    );
  }
}

// Create a Form widget.
class BabyGrowthForm extends StatefulWidget {
  const BabyGrowthForm({super.key});

  @override
  BabyGrowthFormState createState() {
    return BabyGrowthFormState();
  }
}

class BabyGrowthFormState extends State<BabyGrowthForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: 'Type the amount of food (in ml)'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class OmniExample extends StatelessWidget {
  const OmniExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final DateTime? dateTime =
                    await showOmniDateTimePicker(context: context);

                // Use dateTime here
                debugPrint('dateTime: $dateTime');
              },
              child: const Text('Show DateTime Picker'),
            ),
          ],
        ),
      ),
    );
  }
}

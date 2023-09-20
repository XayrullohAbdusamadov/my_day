// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
// ignore: unused_import
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime selectedDate;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    initializeDateFormatting();
    selectedDate = DateTime.now();
    super.initState();
  }

  Future<void> _selectDateBorrowed(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,
      helpText: "TUG'ILGAN YILNI TANLANG!",
      cancelText: "BEKOR QILISH",
      confirmText: "TANLASH",
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var formattedate = DateFormat(
      'y',
      'uz',
    ).format(dateTime);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Mening Tug'ilgan Kunim!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedDate == null
                ? const Text("")
                : Text(
                    "Tug'ilgan Yoshingiz: ${int.parse(
                          DateFormat("y").format(
                            DateTime.now(),
                          ),
                        ) - int.parse(
                          DateFormat("y").format(selectedDate),
                        )} da",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                _selectDateBorrowed(context);
              },
              child: const Text("Yilni tanlash!"),
            ),
          ],
        ),
      ),
    );
  }
}

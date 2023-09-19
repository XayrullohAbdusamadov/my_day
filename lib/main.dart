// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
      home: MyHomePage(
        selectedDate: null,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  DateTime? selectedDate;
  MyHomePage({super.key, required this.selectedDate});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedDate;

  @override
  Widget build(BuildContext context) {
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
                : const Text(
                    "Tug'ilgan Yoshingiz:  ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(1000),
                    lastDate: DateTime.now(),
                    helpText: "TUG'ILGAN YILNI TANLANG!",
                    cancelText: "BEKOR QILISH",
                    confirmText: "TANLASH",
                  ).then(
                    (value) {
                      if (value != null) {
                        setState(() {
                          selectedDate = value;
                          print(DateTime.now());
                   
                        });
                      }
                    },
                  );
                },
                child: const Text("Yilni tanlash!"))
          ],
        ),
      ),
    );
  }
}

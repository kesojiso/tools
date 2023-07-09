import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'object_count_up.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  final apptitle = "Smart Tools";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: apptitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.latoTextTheme(),
          useMaterial3: true,
        ),
        home: MyHomePage(title: apptitle));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Welcome to Smart Tools")),
        body: ListView(
          children: [
            const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(children: [
                  Text(
                    "Welcome to Smart Tools!",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Choose a tool from the list below:",
                    style: TextStyle(fontSize: 20),
                  ),
                ])),
            const Divider(
              thickness: 3.0,
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  border: Border.all(color: Colors.black, width: 3.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListTile(
                      leading: const Icon(Icons.analytics_outlined),
                      title: const Text("Object Count Up"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ObjectCountUp()),
                        );
                      },
                    )),
              ),
            )
          ],
        ));
  }
}

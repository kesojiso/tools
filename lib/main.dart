import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tools/object_measurement.dart';

import 'object_count_up_p1.dart';

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
        colorScheme: const ColorScheme.highContrastDark(),
        textTheme: GoogleFonts.latoTextTheme(),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyHomePage(), // 最初のページ
        '/objectcountup': (BuildContext context) => CameraLoad(),
        '/objectmeasurement': (BuildContext context) =>
            const ObjectMeasurement()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Welcome to Smart Tools")),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/homepage_background.jpeg'),
            fit: BoxFit.cover, //画像が全画面に広がるように設定
          ),
        ),
        child: Center(
          child: ListView(
            children: [
              const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(children: [
                    Text("Smart Tools",
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold)),
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
                        leading: const Icon(
                          Icons.square_foot,
                          color: Colors.black,
                        ),
                        title: const Text("Object Measurement",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        onTap: () {
                          Navigator.of(context).pushNamed('/objectmeasurement');
                        },
                      )),
                ),
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
                        leading: const Icon(
                          Icons.view_in_ar,
                          color: Colors.black,
                        ),
                        title: const Text("Object Count Up",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        onTap: () {
                          Navigator.of(context).pushNamed('/objectcountup');
                        },
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    border: Border.all(color: Colors.black, width: 3.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: Icon(Icons.analytics_outlined),
                        title: Text("Now Developping...",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.normal)),
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ObjectCountUp()),
                        //   );
                        // },
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

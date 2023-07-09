import 'package:flutter/material.dart';

class ObjectCountUp extends StatelessWidget {
  const ObjectCountUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Object Count Up")),
      body: const Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              SizedBox(width: 30, child: Text("xx")),
              Text(":yyy")
            ]),
            SizedBox(height: 10),
            Row(children: [
              SizedBox(width: 30, child: Text("aa")),
              Text(":bbb")
            ])
          ],
        ),
      ),
    );
  }
}

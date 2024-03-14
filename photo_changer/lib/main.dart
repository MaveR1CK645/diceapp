import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    (const MaterialApp(
      home: MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentImages = 1;
  bool anotherTheme = false;

  void changePhoto(int index) {
    setState(() {
      currentImages = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anotherTheme ? Colors.blue.shade100 : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: anotherTheme ? Colors.green : Colors.amber,
        title: Text(
          'changer',
          style: TextStyle(
              color: anotherTheme ? Colors.yellow : Colors.pink,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: anotherTheme ? Colors.deepPurple : Colors.white,
                image: DecorationImage(
                  image: AssetImage('asset/avatar$currentImages.png'),
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(anotherTheme ? Colors.red: Colors.lightBlue),
                ),
                onPressed: () {
                  setState(() {
                    anotherTheme = anotherTheme == true ? false : true;
                  });
                  changePhoto(Random().nextInt(8) + 1);
                },
                child: Text(
                  'Izmenit foto',
                  style: TextStyle(
                    color: anotherTheme ? Colors.black: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream; // for multiple subscribers
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream(); // for multiple subscribers asBroadcastStream is used 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
                stream: dataStream,
                builder: (context, AsyncSnapshot) {
                  if (AsyncSnapshot.hasData) {
                    return Text(
                      // subscriber
                      AsyncSnapshot.data ?? 'Null Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Text(
                      // subscriber
                      'No Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                }),
                StreamBuilder<String>(
                stream: dataStream,
                builder: (context, AsyncSnapshot) {
                  if (AsyncSnapshot.hasData) {
                    return Text(
                      // subscriber
                      AsyncSnapshot.data ?? 'Null Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Text(
                      // subscriber
                      'No Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textEditingController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                streamController.add(textEditingController.text);
              },
              child: Text('Done'),
            ),
          ],
        )),
      ),
    );
  }
}



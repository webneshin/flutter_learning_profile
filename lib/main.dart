import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo With Webneshin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
          actions: const [
            Icon(Icons.chat),
            SizedBox(width: 10),
            Icon(Icons.more_vert),
            SizedBox(width: 10),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/profile_image.jpg",
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("data data data data "),
                      SizedBox(
                        height: 2,
                      ),
                      Text("data data data data data data "),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text("Iran, Tehran")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
              child: Text("jdfh glkjdhfgls jkdfg lkjdhfg dkjhv dcvn dcvb,a mdsb fv ,amndsf v,mansbd ,asdnmb ,mdnabv ,adsbf lahgfd laksjdf lkajs dfg lkajsdfg lkajhdg ladhgf lahjkd jahdgf kjahsd kv ,sc;lksadhf ;jhdfglkj dlfkgh lakjsdh laksjhdg lakjhfg lakjdg "),
            )
          ],
        ));
  }
}

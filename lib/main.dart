import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo With Webneshin',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.pink.shade400,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(
              fontSize: 13, color: Color.fromARGB(150, 255, 255, 255)),
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
        )),
        dividerTheme: const DividerThemeData(
          indent: 5,
          endIndent: 5,
        )
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
          title: Text("پروفایل کاربر"),
          actions: const [
            Icon(Icons.chat_bubble_outline),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "سجاد ابراهیمی ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("برنامه نویس بک اند و فلاتر"),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 18,
                            ),
                            Text(
                              "ایران، تهران",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.favorite_border,
                      color: Theme.of(context).primaryColor)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(32, 0, 16, 32),
              child: Text(
                "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Divider(),
          ],
        ));
  }
}

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
    Color surfaceColor = Colors.white10;
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
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: surfaceColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink.shade400))
          ),
          dividerTheme: DividerThemeData(
            color: surfaceColor,
            indent: 5,
            endIndent: 5,
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType { none, dreamweaver, fireworks, indesign, mediaEncoder, xd }

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill_type = _SkillType.none;

  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skill_type = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("پروفایل کاربر"),
          actions: const [
            Icon(Icons.chat_bubble_outline),
            SizedBox(width: 10),
            Icon(Icons.more_vert),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          const SizedBox(
                            height: 2,
                          ),
                          const Text("برنامه نویس بک اند و فلاتر"),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
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
                padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                child: Text(
                  "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("مهارت ها",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 15,
                    )
                  ],
                ),
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Skill(
                      title: "دریم ایور",
                      imagePath:
                          'assets/images/icons8-adobe-dreamweaver-144.png',
                      shadowColor: Colors.lightGreen,
                      isActive: _skill_type == _SkillType.dreamweaver,
                      type: _SkillType.dreamweaver,
                      onTap: () {
                        updateSelectedSkill(_SkillType.dreamweaver);
                      },
                    ),
                    Skill(
                      title: "فایرورک",
                      imagePath: 'assets/images/icons8-adobe-fireworks-144.png',
                      shadowColor: Colors.yellow,
                      isActive: _skill_type == _SkillType.fireworks,
                      type: _SkillType.fireworks,
                      onTap: () {
                        updateSelectedSkill(_SkillType.fireworks);
                      },
                    ),
                    Skill(
                      title: "ایندیزاین",
                      imagePath: 'assets/images/icons8-adobe-indesign-144.png',
                      shadowColor: Colors.redAccent,
                      isActive: _skill_type == _SkillType.indesign,
                      type: _SkillType.indesign,
                      onTap: () {
                        updateSelectedSkill(_SkillType.indesign);
                      },
                    ),
                    Skill(
                      title: "مدیا انکودر",
                      imagePath:
                          'assets/images/icons8-adobe-media-encoder-144.png',
                      shadowColor: Colors.deepPurple,
                      isActive: _skill_type == _SkillType.mediaEncoder,
                      type: _SkillType.mediaEncoder,
                      onTap: () {
                        updateSelectedSkill(_SkillType.mediaEncoder);
                      },
                    ),
                    Skill(
                      title: "ایکس دی",
                      imagePath: 'assets/images/icons8-adobe-xd-144.png',
                      shadowColor: Colors.deepPurpleAccent,
                      isActive: _skill_type == _SkillType.xd,
                      type: _SkillType.xd,
                      onTap: () {
                        updateSelectedSkill(_SkillType.xd);
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("اطلاعات ورود",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'ایمیل',
                            prefixIcon: Icon(Icons.alternate_email)),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'رمز عبور',
                            prefixIcon: Icon(Icons.password)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("ذخیره")))
                    ],
                  )),
            ],
          ),
        ));
  }
}

class Skill extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final _SkillType type;
  final Function() onTap;

  const Skill({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);
    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerTheme.color,
                borderRadius: defaultBorderRadius,
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.5),
                        blurRadius: 10,
                      )
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}

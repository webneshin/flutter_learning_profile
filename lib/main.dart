import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.dark;
  Locale _locale = Locale("fa");

  @override
  Widget build(BuildContext context) {
    // Color surfaceColor = Colors.white10;
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // supportedLocales: const [
      //   Locale("fa"),
      //   Locale("en"),
      // ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo With Webneshin',
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(_locale.languageCode)
          : MyAppThemeConfig.light().getTheme(_locale.languageCode),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
        getThemeMode: () {
          return themeMode;
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  static const faFontFamily = "iranyekan";
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig({
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.surfaceColor,
    required this.backgroundColor,
    required this.appBarColor,
    required this.brightness,
  });

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Colors.white10,
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900,
        surfaceColor = Colors.black12,
        backgroundColor = Colors.white,
        appBarColor = Colors.white60,
        brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
        useMaterial3: true,
        fontFamily: languageCode == "fa" ? faFontFamily : "",
        primaryColor: primaryColor,
        brightness: brightness,
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: languageCode == 'en' ? enTextTheme : faTextTheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.pink.shade400))),
        dividerTheme: DividerThemeData(
          color: surfaceColor,
          indent: 5,
          endIndent: 5,
        ));
  }

  TextTheme get enTextTheme => GoogleFonts.latoTextTheme(TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: primaryTextColor),
        bodySmall: TextStyle(fontSize: 13, color: secondaryTextColor),
        titleMedium:
            TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
      ));

  TextTheme get faTextTheme => TextTheme(
        bodyMedium: TextStyle(
            fontSize: 16, color: primaryTextColor, fontFamily: faFontFamily),
        bodySmall: TextStyle(
            fontSize: 13, color: secondaryTextColor, fontFamily: faFontFamily),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontFamily: faFontFamily),
      );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function() getThemeMode;

  const MyHomePage(
      {super.key, required this.toggleThemeMode, required this.getThemeMode});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill_type = _SkillType.none;
  bool _password_show = false;

  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skill_type = skillType;
    });
  }

  void togglePasswordShow() {
    setState(() {
      _password_show = !_password_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _translate = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: Text(_translate.userProfile),
          actions: [
            InkWell(
                onTap: widget.toggleThemeMode,
                child: Icon(widget.getThemeMode() == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode)),
            const SizedBox(width: 10),
            const Icon(Icons.chat_bubble_outline),
            const SizedBox(width: 10),
            const Icon(Icons.more_vert),
            const SizedBox(width: 10),
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
                            _translate.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(_translate.job),
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
                                _translate.location,
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
                  // "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.",
                  _translate.summery,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                child: Row(
                  children: [
                    Text(_translate.selectedLanguage),
                    CupertinoSlidingSegmentedControl(children: children, onValueChanged: onValueChanged)
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_translate.skills,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
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
                      title: "Dreamweaver",
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
                      title: "Fireworks",
                      imagePath: 'assets/images/icons8-adobe-fireworks-144.png',
                      shadowColor: Colors.yellow,
                      isActive: _skill_type == _SkillType.fireworks,
                      type: _SkillType.fireworks,
                      onTap: () {
                        updateSelectedSkill(_SkillType.fireworks);
                      },
                    ),
                    Skill(
                      title: "Indesign",
                      imagePath: 'assets/images/icons8-adobe-indesign-144.png',
                      shadowColor: Colors.redAccent,
                      isActive: _skill_type == _SkillType.indesign,
                      type: _SkillType.indesign,
                      onTap: () {
                        updateSelectedSkill(_SkillType.indesign);
                      },
                    ),
                    Skill(
                      title: "Media Encoder",
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
                      title: "XD",
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
                      Text(_translate.userInformation,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                            labelText: _translate.email,
                            prefixIcon: Icon(Icons.alternate_email)),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        obscureText: !_password_show,
                        decoration: InputDecoration(
                            labelText: _translate.password,
                            suffixIcon: InkWell(
                                onTap: () {
                                  togglePasswordShow();
                                },
                                child: Icon(Icons.remove_red_eye_outlined)),
                            prefixIcon: Icon(Icons.password)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text(_translate.save)))
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

enum _SkillType { none, dreamweaver, fireworks, indesign, mediaEncoder, xd }

enum _Language {en,fa}
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tasbih/colors.dart';
import 'package:tasbih/pages/choose.dart';

class HomePage extends StatefulWidget {
  List myList = [];
  int? start;
  HomePage({super.key, required this.myList, this.start});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List startList = ["سبحان الله", "الحمدلله", "الله أكبر"];
  int startIndex = 0;
  int index = 0;
  int rad = 0;
  int numberOfTasbeh = 33;
  int sum = 0;
  int countRepeated = 0;
  DateTime now = DateTime.now();
  double per = 0;
  int count = 0;
  String txt = "سبحان الله";
  Color mainColor = red;
  bool isVisible = false;
  bool isInfoPressed = false;
  setColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("mainColorValue", mainColor.value);
  }

  getColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mainColor = Color(prefs.getInt("mainColorValue") ?? mainColor.value);
    });
  }

  @override
  void initState() {
    setState(() {
      getColor();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Container(
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(color: mainColor),
                    child: Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              )),
                          const Text(
                            "أضغط على الصفحة للدخول اليها",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )),
                ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => Choose(
                                    mainColor: mainColor,
                                  )));
                    },
                    child: Text(
                      "أختر التسبيح الذي تريده",
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                  ),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => Choose(
                                      mainColor: mainColor,
                                    )));
                      },
                      icon: Icon(
                        Icons.edit_attributes_rounded,
                        color: mainColor,
                        size: 35.sp,
                      )),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: mainColor,
          toolbarHeight: 50.h,
          centerTitle: true,
          title: Text(
            "تـسـبـيـح",
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 325),
                  transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                            : Tween<double>(begin: 0.75, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                  child: !isVisible
                      ? Icon(
                          Icons.color_lens,
                          key: const ValueKey('icon1'),
                          color: Colors.white,
                          size: 30.sp,
                        )
                      : Icon(
                          Icons.color_lens_outlined,
                          key: const ValueKey('icon2'),
                          color: Colors.white70,
                          size: 25.sp,
                        )),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: mainColor),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "الهدف",
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.sp),
                        ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () => setState(() {
                                    now = DateTime.now();
                                    numberOfTasbeh--;
                                    if (numberOfTasbeh < count &&
                                        numberOfTasbeh > 0) {
                                      count = 1;
                                      per = count / numberOfTasbeh;
                                      countRepeated++;
                                    } else if (numberOfTasbeh > 0)
                                      per = count / numberOfTasbeh;
                                    if (numberOfTasbeh == -1) {
                                      numberOfTasbeh = 0;
                                    }
                                  }),
                              icon: Icon(
                                Icons.remove_circle_rounded,
                                color: Colors.white,
                                size: 24.sp,
                              )),
                          Text(
                            "$numberOfTasbeh",
                            style:
                                TextStyle(color: Colors.white, fontSize: 21.sp),
                          ),
                          IconButton(
                              onPressed: () => setState(() {
                                    now = DateTime.now();
                                    numberOfTasbeh++;

                                    if (per == 1) {
                                      per = 0;
                                      count = 0;
                                    } else {
                                      per = count / numberOfTasbeh;
                                    }
                                  }),
                              icon: Icon(
                                Icons.add_circle_rounded,
                                color: Colors.white,
                                size: 24.sp,
                              )),
                        ],
                      ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 9.w),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: GestureDetector(
                              onTap: () => setState(() {
                                numberOfTasbeh = 0;
                              }),
                              child: Text(
                                "0",
                                style: TextStyle(
                                    color: mainColor, fontSize: 21.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: GestureDetector(
                              onTap: () => setState(() {
                                numberOfTasbeh = 33;
                              }),
                              child: Text(
                                "33",
                                style: TextStyle(
                                    color: mainColor, fontSize: 21.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: GestureDetector(
                              onTap: () => setState(() {
                                numberOfTasbeh = 99;
                              }),
                              child: Text(
                                "99",
                                style: TextStyle(
                                    color: mainColor, fontSize: 21.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: GestureDetector(
                              onTap: () => setState(() {
                                numberOfTasbeh = 100;
                              }),
                              child: Text(
                                "100+",
                                style: TextStyle(
                                    color: mainColor, fontSize: 21.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: GestureDetector(
                              onTap: () => setState(() {
                                numberOfTasbeh = 1000;
                              }),
                              child: Text(
                                "1000+",
                                style: TextStyle(
                                    color: mainColor, fontSize: 21.sp),
                              ),
                            ),
                          )
                        ],
                      ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                    ]),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text(
                          widget.start == 0
                              ? startList[startIndex]
                              : "${widget.myList[0][index]}",
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        child: Text(
                          "$count",
                          style: TextStyle(fontSize: 23.sp, color: mainColor),
                        ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: CircularStepProgressIndicator(
                          totalSteps: numberOfTasbeh == 0 ? 1 : numberOfTasbeh,
                          currentStep: count,
                          selectedColor: mainColor,
                          unselectedColor: mainColor.withOpacity(0.2),
                          padding: 0,
                          width: 105.w,
                          child: GestureDetector(
                            onTap: () => setState(() {
                              now = DateTime.now();
                              if (numberOfTasbeh != 0) {
                                count++;
                                sum++;
                                if (count > numberOfTasbeh) {
                                  per = (count - 1) / numberOfTasbeh;
                                  count = 1;
                                }
                                per = count / numberOfTasbeh;
                                if (numberOfTasbeh != count) {}
                                if (count == numberOfTasbeh) {
                                  countRepeated++;
                                  if (widget.myList[0].isEmpty == false) {
                                    if (widget.myList[0].length == index + 1 &&
                                        widget.start == 1) {
                                      index = 0;
                                    } else if (widget.myList[0].length !=
                                            index + 1 &&
                                        widget.start == 1) index++;
                                  }
                                  if (startList.length == startIndex + 1 &&
                                      widget.start == 0) {
                                    startIndex = 0;
                                  } else if (startList.length !=
                                          startIndex + 1 &&
                                      widget.start == 0) startIndex++;
                                  if (countRepeated % 3 == 0) {
                                    txt = "سبحان الله";
                                  } else if (countRepeated % 3 == 1)
                                    txt = "الله أكبر";
                                  else if (countRepeated % 3 == 2)
                                    txt = "الحمدلله";
                                }
                              }
                            }),
                            child: Icon(
                              Icons.touch_app,
                              size: 53.sp,
                            ),
                          ),
                        ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Text(
                          "عدد مرات التكرار : $countRepeated",
                          style: TextStyle(fontSize: 21.sp, color: mainColor),
                        ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                      ),
                      Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Text(
                          "المجموع : $sum",
                          style: TextStyle(fontSize: 21.sp, color: mainColor),
                        ).animate().fade(duration: 500.ms).scale(delay: 10.ms),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4.h, right: 1.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 3.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(500))),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        now = DateTime.now();
                                        numberOfTasbeh = 0;
                                        count = 0;
                                        countRepeated = 0;
                                        sum = 0;
                                        index = 0;
                                        startIndex = 0;
                                      });
                                    },
                                    icon: AnimatedSwitcher(
                                      duration: Duration(milliseconds: 550),
                                      transitionBuilder: (child, anim) =>
                                          RotationTransition(
                                        turns: child.key == ValueKey('icon1')
                                            ? Tween<double>(begin: 0.5, end: 1)
                                                .animate(anim)
                                            : Tween<double>(begin: 1, end: 0.5)
                                                .animate(anim),
                                        child: FadeTransition(
                                            opacity: anim, child: child),
                                      ),
                                      child: count != 0
                                          ? Icon(Icons.refresh,
                                              size: 25.sp,
                                              color: Colors.white,
                                              key: const ValueKey('icon2'))
                                          : Icon(Icons.refresh,
                                              size: 25.sp,
                                              color: Colors.white,
                                              key: const ValueKey('icon1')),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !isVisible,
                                child: Text(
                                  "التاريخ : ${now.day}/${now.month}/${now.year}",
                                  style: TextStyle(
                                      color: mainColor, fontSize: 21.sp),
                                )
                                    .animate()
                                    .fade(duration: 500.ms)
                                    .scale(delay: 10.ms),
                              ),
                              Visibility(
                                visible: isVisible,
                                child: Row(
                                  children: [
                                    Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => red),
                                        value: red,
                                        groupValue: mainColor,
                                        onChanged: (val) {
                                          setState(() {
                                            mainColor = val!;
                                            setColor();
                                          });
                                        }),
                                    Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => pink),
                                        value: pink,
                                        groupValue: mainColor,
                                        onChanged: (val) {
                                          mainColor = val!;
                                          setState(() {
                                            setColor();
                                          });
                                        }),
                                    Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => black),
                                        value: black,
                                        groupValue: mainColor,
                                        onChanged: (val) {
                                          setState(() {
                                            mainColor = val!;
                                            setColor();
                                          });
                                        }),
                                    Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => sky),
                                        value: sky,
                                        groupValue: mainColor,
                                        onChanged: (val) {
                                          setState(() {
                                            mainColor = val!;
                                            setColor();
                                          });
                                        }),
                                  ],
                                )
                                    .animate()
                                    .fade(duration: 500.ms)
                                    .scale(delay: 10.ms),
                              ),
                              IconButton(
                                onPressed: () {
                                  now = DateTime.now();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Animate(
                                        effects: [FlipEffect(duration: 500.ms)],
                                        child: AlertDialog(
                                          insetPadding: const EdgeInsets.all(1),
                                          backgroundColor:
                                              mainColor.withOpacity(0.8),
                                          title: const Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              'تـسـبـيـح',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          content: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'هذا البرنامج صدقة على روح المرحوم محمد كامل محمد',
                                                    style: TextStyle(
                                                        fontSize: 19.sp,
                                                        color: Colors.white),
                                                  ),
                                                  const Spacer(),
                                                  const Center(
                                                    child: Text(
                                                      "-الـرجـاء الـدعـاء لـه-",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                now = DateTime.now();
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                                setState(() {
                                                  isInfoPressed =
                                                      !isInfoPressed;
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  15))),
                                                  padding:
                                                      EdgeInsets.all(12.sp),
                                                  child: Text(
                                                    'خروج',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp,
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  setState(() {
                                    isInfoPressed = !isInfoPressed;
                                  });
                                },
                                icon: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 600),
                                  transitionBuilder: (child, anim) =>
                                      RotationTransition(
                                    turns: child.key == ValueKey('icon1')
                                        ? Tween<double>(begin: 1, end: 1)
                                            .animate(anim)
                                        : Tween<double>(begin: 0.5, end: 0.5)
                                            .animate(anim),
                                    child: FadeTransition(
                                        opacity: anim, child: child),
                                  ),
                                  child: isInfoPressed
                                      ? Icon(Icons.info_outline,
                                          size: 40.sp,
                                          color: mainColor,
                                          key: const ValueKey('icon2'))
                                      : Icon(Icons.info,
                                          size: 42.sp,
                                          color: mainColor,
                                          key: const ValueKey('icon1')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

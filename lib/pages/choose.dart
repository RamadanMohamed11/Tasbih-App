import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasbih/pages/home_page.dart';

class Choose extends StatefulWidget {
  Color? mainColor;
  Choose({super.key, this.mainColor});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  List myList = [];
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;
  bool isBack = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => RotationTransition(
                      turns: child.key == ValueKey('icon1')
                          ? Tween<double>(begin: 0.75, end: 1).animate(anim)
                          : Tween<double>(begin: 1, end: 0.75).animate(anim),
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                child: isBack
                    ? Icon(Icons.arrow_circle_left_rounded,
                        color: widget.mainColor,
                        size: 45.sp,
                        key: const ValueKey('icon1'))
                    : Icon(Icons.close,
                        color: widget.mainColor,
                        size: 30.sp,
                        key: const ValueKey('icon2'))),
            onPressed: () {
              setState(() {
                if (myList.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "يجب أن تقوم بإختيار واحد على الأقل",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    duration: 1500.ms,
                    backgroundColor: Colors.red.withOpacity(0.8),
                  ));
                } else {
                  Navigator.pushReplacement(
                      (context),
                      MaterialPageRoute(
                          builder: ((context) => HomePage(
                                myList: [myList],
                                start: 1,
                              ))));
                }
              });
            }),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: widget.mainColor,
          title: Text(
            "تـسـبـيـح",
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              width: isSelected1 ? 6.w : 5.w,
                              color: isSelected1 ? Colors.green : Colors.red),
                          color: isSelected1 == true
                              ? widget.mainColor
                              : widget.mainColor!.withOpacity(0.5)),
                      child: SwitchListTile(
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.black.withOpacity(0.5),
                          title: Text(
                            "سبحان الله",
                            style: TextStyle(
                                color:
                                    isSelected1 ? Colors.white : Colors.black,
                                fontSize: 21,
                                fontWeight: isSelected1
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          value: isSelected1,
                          onChanged: (val) {
                            setState(() {
                              isSelected1 = !isSelected1;
                              if (isSelected1) {
                                myList.add("سبحان الله");
                              } else {
                                myList.remove("سبحان الله");
                              }
                              if (myList.isEmpty)
                                isBack = false;
                              else
                                isBack = true;
                            });
                          }),
                    ).animate().flipH(duration: 325.ms, delay: 10.ms),
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              width: isSelected2 ? 6.w : 5.w,
                              color: isSelected2 ? Colors.green : Colors.red),
                          color: isSelected2 == true
                              ? widget.mainColor
                              : widget.mainColor!.withOpacity(0.5)),
                      child: SwitchListTile(
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.black.withOpacity(0.5),
                          title: Text(
                            "الحمد الله",
                            style: TextStyle(
                                color:
                                    isSelected2 ? Colors.white : Colors.black,
                                fontSize: 21,
                                fontWeight: isSelected2
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          value: isSelected2,
                          onChanged: (val) {
                            setState(() {
                              isSelected2 = !isSelected2;
                              if (isSelected2) {
                                myList.add("الحمد الله");
                              } else {
                                myList.remove("الحمد الله");
                              }
                              if (myList.isEmpty)
                                isBack = false;
                              else
                                isBack = true;
                            });
                          }),
                    ).animate().flipH(duration: 325.ms, delay: 300.ms),
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              width: isSelected3 ? 6.w : 5.w,
                              color: isSelected3 ? Colors.green : Colors.red),
                          color: isSelected3 == true
                              ? widget.mainColor
                              : widget.mainColor!.withOpacity(0.5)),
                      child: SwitchListTile(
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.black.withOpacity(0.5),
                          title: Text(
                            "الله أكبر",
                            style: TextStyle(
                                color:
                                    isSelected3 ? Colors.white : Colors.black,
                                fontSize: 21,
                                fontWeight: isSelected3
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          value: isSelected3,
                          onChanged: (val) {
                            setState(() {
                              isSelected3 = !isSelected3;
                              if (isSelected3) {
                                myList.add("الله أكبر");
                              } else {
                                myList.remove("الله أكبر");
                              }
                              if (myList.isEmpty)
                                isBack = false;
                              else
                                isBack = true;
                            });
                          }),
                    ).animate().flipH(duration: 325.ms, delay: 600.ms),
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              width: isSelected4 ? 6.w : 5.w,
                              color: isSelected4 ? Colors.green : Colors.red),
                          color: isSelected4 == true
                              ? widget.mainColor
                              : widget.mainColor!.withOpacity(0.5)),
                      child: SwitchListTile(
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.black.withOpacity(0.5),
                          title: Text(
                            "لا إله إلا الله",
                            style: TextStyle(
                                color:
                                    isSelected4 ? Colors.white : Colors.black,
                                fontSize: 21,
                                fontWeight: isSelected4
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          value: isSelected4,
                          onChanged: (val) {
                            setState(() {
                              isSelected4 = !isSelected4;
                              if (isSelected4) {
                                myList.add("لا إله إلا الله");
                              } else {
                                myList.remove("لا إله إلا الله");
                              }
                              if (myList.isEmpty)
                                isBack = false;
                              else
                                isBack = true;
                            });
                          }),
                    ).animate().flipH(duration: 325.ms, delay: 900.ms),
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              width: isSelected5 ? 6.w : 5.w,
                              color: isSelected5 ? Colors.green : Colors.red),
                          color: isSelected5 == true
                              ? widget.mainColor
                              : widget.mainColor!.withOpacity(0.5)),
                      child: SwitchListTile(
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.black.withOpacity(0.5),
                          title: Text(
                            "لا حول ولا قوة إلا بالله",
                            style: TextStyle(
                                color:
                                    isSelected5 ? Colors.white : Colors.black,
                                fontSize: 21,
                                fontWeight: isSelected5
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          value: isSelected5,
                          onChanged: (val) {
                            setState(() {
                              isSelected5 = !isSelected5;
                              if (isSelected5) {
                                myList.add("لا حول ولا قوة إلا بالله");
                              } else {
                                myList.remove("لا حول ولا قوة إلا بالله");
                              }
                              if (myList.isEmpty)
                                isBack = false;
                              else
                                isBack = true;
                            });
                          }),
                    ).animate().flipH(duration: 325.ms, delay: 1200.ms),
                    Container(
                      margin: EdgeInsets.all(5.sp),
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              width: isSelected6 ? 6.w : 5.w,
                              color: isSelected6 ? Colors.green : Colors.red),
                          color: isSelected6 == true
                              ? widget.mainColor
                              : widget.mainColor!.withOpacity(0.5)),
                      child: SwitchListTile(
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.black.withOpacity(0.5),
                          title: Text(
                            "أستغفر الله",
                            style: TextStyle(
                                color:
                                    isSelected6 ? Colors.white : Colors.black,
                                fontSize: 21,
                                fontWeight: isSelected6
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          value: isSelected6,
                          onChanged: (val) {
                            setState(() {
                              isSelected6 = !isSelected6;
                              if (isSelected6) {
                                myList.add("أستغفر الله");
                              } else {
                                myList.remove("أستغفر الله");
                              }
                              if (myList.isEmpty)
                                isBack = false;
                              else
                                isBack = true;
                            });
                          }),
                    ).animate().flipH(duration: 325.ms, delay: 1500.ms),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.6,
                      padding: EdgeInsets.all(5.sp),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: widget.mainColor!.withOpacity(0.7),
                          border:
                              Border.all(color: widget.mainColor!, width: 10)),
                      child: Text(
                        myList.isEmpty ? "" : "$myList",
                        style: TextStyle(fontSize: 21.sp),
                      ),
                    ).animate().flipV(duration: 1800.ms),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

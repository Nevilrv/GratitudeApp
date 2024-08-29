import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gratitude_app/screen/setting_screen.dart';
import 'package:gratitude_app/screen/upgrade_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'data_add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreensState();
}




class _HomeScreensState extends State<HomeScreen> {
  Box<String>? dataBox;
  @override
  void initState() {
    dataBox = Hive.box<String>("Note");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return DataAddScreen();
          }));
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Gratitudes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return UpgradeScreen();
              }));
              print('Premium');
            },
            child: Image.asset(
              'assets/images/crown.png',
              height: 40.h,
              width: 40.w,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SettingScreen();
                      }));
                    },
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SettingScreen();
                    }));
                  },
                )
              ];
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: dataBox!.listenable(),
        builder: (BuildContext context, Box<String> value, _) {

          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {var key = value.keys.toList()[index];
            var values = dataBox!.get(key);
              return Container(
                margin: EdgeInsets.all(10.h),
                height: 90.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Colors.red,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return DataAddScreen();
                          }));
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 24.h),
                            Text(
                              '22',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'FEB',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp),
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w),
                        Column(
                          children: [
                            SizedBox(height: 25.h),
                            Text(
                              '${values}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/smile.png',
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(3.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.h, vertical: 4.h),
                                    child: Text(
                                      '${values![1]}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

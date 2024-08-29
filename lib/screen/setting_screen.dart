import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitch = false;
  bool isSwitch1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Reminder',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'Remind',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp),
                ),
                Spacer(),
                Switch(
                    activeTrackColor: Colors.amber,
                    inactiveTrackColor: Colors.grey,
                    value: isSwitch,
                    onChanged: (value) {
                      setState(() {
                        isSwitch = value;
                      });
                    })
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'Notification',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp),
                ),
                Spacer(),
                Switch(
                    activeTrackColor: Colors.amber,
                    inactiveTrackColor: Colors.grey,
                    value: isSwitch1,
                    onChanged: (value) {
                      setState(() {
                        isSwitch1 = value;
                      });
                    })
              ],
            ),
            SizedBox(height: 40.h),
            Text(
              'About',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp),
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Rate Us',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Share',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Version Number',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp),
                  ),
                  Spacer(),
                  Text(
                    '1.0.0',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp),
                  ),Spacer(),
                  Text(
                    'Free',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

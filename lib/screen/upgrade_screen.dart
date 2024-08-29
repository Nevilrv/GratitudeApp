import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({Key? key}) : super(key: key);

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Center(
              child: Text(
                'Upgrade to\nPremium',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 100.h),
            Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.blue,
                ),
                SizedBox(width: 20.w),
                Text(
                  'More Mood States',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Icon(
                  Icons.add_task,
                  color: Colors.blue,
                ),
                SizedBox(width: 20.w),
                Text(
                  'Unlimited Tages',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Icon(
                  Icons.date_range,
                  color: Colors.blue,
                ),
                SizedBox(width: 20.w),
                Text(
                  'Current Date-Time',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 100.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.r)),
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  40.h,
                ),
              ),
              child: Text(
                'UPGRADE',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '\u{20B9}333.08.one-time Purchase',
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}

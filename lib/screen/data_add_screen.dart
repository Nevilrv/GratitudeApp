import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class DataAddScreen extends StatefulWidget {
  const DataAddScreen({Key? key}) : super(key: key);

  @override
  State<DataAddScreen> createState() => _DataAddScreenState();
}

class _DataAddScreenState extends State<DataAddScreen> {

  Box<String>? dataBox;

  final title = TextEditingController();
  final content = TextEditingController();

  int selector = 0;

  @override
  void initState() {
    dataBox = Hive.box<String>("Note");
    super.initState();
  }
  final listController = TextEditingController();

  List emojiData = [
    'assets/images/care.png',
    'assets/images/cool.png',
    'assets/images/crying.png',
    'assets/images/emoji.png',
    'assets/images/hug.png',
    'assets/images/laughing.png',
    'assets/images/neutral.png',
    'assets/images/sad.png',
    'assets/images/smile.png',
    'assets/images/star.png',
    'assets/images/surprised.png',
    'assets/images/thinking.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () async{
                await dataBox!.put("${Random().nextInt(100)}",
                    "${title.text}\n${content.text}");

                Navigator.pop(context);
                title.clear();
                content.clear();
              },
              child: const Text(
                "SAVE",
                style: TextStyle(fontSize: 16),
              )),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "I'm grateful for",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 15.h),
            TextFormField(
              controller: title,
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: "List",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 500.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "How do you feel?",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              itemCount: 12,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: 100,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(onTap: (){
                                  setState(() {
                                    selector=index;
                                  });
                                },
                                  child: Container(

                                    // color: Colors.red,
                                    child: Center(
                                      child: Image.asset(
                                        '${emojiData[index]}',
                                        height: 60.h,
                                        width: 60.w,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 30),
                  Image.asset(selector==0?'assets/images/cool.png':selector==1?'assets/images/crown.png':'assets/images/hug.png'),
                  SizedBox(width: 20),
                  Text(
                    'Empty',
                    style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Align(
                                child: TextButton(
                                    onPressed: () async {
                                      // await dataBox!.put("${Random().nextInt(100)}",
                                      //     "${title.text}\n${content.text}");
                                      Navigator.pop(context);
                                      // title.clear();
                                      content.clear();
                                    },
                                    child: const Text(
                                      "Done",
                                      style: TextStyle(fontSize: 16),
                                    )),alignment: Alignment.topRight,
                              ),

                              TextFormField(
                                controller: content,
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                    hintText: 'Enter The Tags'),
                              ),

                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_task,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 30),
                      Text(
                        'Tags',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      SizedBox(width: 28),
                      Text(
                        'Empty',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Date',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  SizedBox(width: 26),
                  Text(
                    '${DateTime
                        .now()
                        .day}.${DateTime
                        .now()
                        .month}.${DateTime
                        .now()
                        .year} ${DateTime
                        .now()
                        .hour}.${DateTime
                        .now()
                        .minute}',
                    style: TextStyle(color: Colors.grey, fontSize: 18.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

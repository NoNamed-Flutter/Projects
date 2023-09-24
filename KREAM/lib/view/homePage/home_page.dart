import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kream/view/homePage/recommend_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            ///AppBar
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 80.h),
                  child: Container(
                    width: 528.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: const Center(
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Color(0xFFB4B4B4)),
                              hintText: '브랜드, 상품, 프로필, 태그 등',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),

            TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              labelStyle: const TextStyle(color: Colors.blue),
              tabs: [
                Tab(
                  height: 40.h,
                  child: const Text(
                    '추천',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  height: 40.h,
                  child: const Text(
                    '랭킹',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  height: 40.h,
                  child: const Text(
                    '발매 정보',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ReCommandBody(),
                  SizedBox.expand(),
                  SizedBox.expand(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

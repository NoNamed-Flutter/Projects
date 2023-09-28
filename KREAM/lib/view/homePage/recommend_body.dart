import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kream/view/viewWidget/circles.dart';
import 'package:kream/view/viewWidget/clothes.dart';
import 'package:kream/view/viewWidget/picture.dart';

import 'package:kream/view/viewList/clothes_list.dart';

class ReCommandBody extends StatefulWidget {
  const ReCommandBody({super.key});

  @override
  State<ReCommandBody> createState() => _ReCommandBodyState();
}

class _ReCommandBodyState extends State<ReCommandBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///배너
          SizedBox(
            width: 648.w,
            height: 587.h,
            child: PageView(
              physics: const ClampingScrollPhysics(),
              children: [
                Container(width: 100.w, height: 100.w, color: Colors.red),
                Container(width: 100.w, height: 100.w, color: Colors.orange),
                Container(width: 100.w, height: 100.w, color: Colors.yellow),
                Container(width: 100.w, height: 100.w, color: Colors.green),
                Container(width: 100.w, height: 100.w, color: Colors.blue),
              ],
            ),
          ),

          /// 배너 밑 모든것
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 동그라미 5개
                Padding(
                  padding: EdgeInsets.only(top: 38.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      circle(true, '크림 드로우'),
                      circle(true, '실시간 차트'),
                      circle(true, '남성 추천'),
                      circle(true, '여성 추천'),
                      circle(false, '10% 정립 브랜트'),
                    ],
                  ),
                ),

                ///밑에 동그라미 5개
                Padding(
                  padding: EdgeInsets.only(top: 38.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      circle(true, '정가 아래'),
                      circle(true, '트루릴리전23FW'),
                      circle(true, '패밀리세일&드로우'),
                      circle(true, '9월혜택모음'),
                      circle(false, '무조건 포인트'),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 46.h, bottom: 40.h),
                  child: const Divider(height: 2),
                ),
                //
                /// Just Dropped Title
                Padding(
                  padding: EdgeInsets.only(bottom: 14.h),
                  child: Text(
                    'Just Dropped',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ),

                /// 발매 상품 Subtitle
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: const Text(
                    '발매 상품',
                    style: TextStyle(color: Color(0xFF919191)),
                  ),
                ),
                //
                ///Clothes
                Padding(
                  padding: EdgeInsets.only(bottom: 44.h),
                  child: SizedBox(
                    height: 468.h,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: clothesList.length,
                      itemBuilder: (context, index) {
                        return Clothes(
                          title: clothesList[index]['title'],
                          product: clothesList[index]['product'],
                          content: clothesList[index]['content'],
                          tagNumber: clothesList[index]['tagNumber'],
                          tags: clothesList[index]['tags'],
                          discount: clothesList[index]['discount'],
                          price: clothesList[index]['price'],
                          purchase: clothesList[index]['purchase'],
                          icon: clothesList[index]['icon'],
                        );
                      },
                    ),
                  ),
                ),
                Divider(height: 2.h),
                //
                /// Top 15 Brand Title
                Padding(
                  padding: EdgeInsets.only(top: 46.h, bottom: 10.h),
                  child: Text(
                    'Top 15 Brand',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: const Text(
                    '인기 탑 15 브랜드',
                    style: TextStyle(color: Color(0xFF919191)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      circle(true, '스투시'),
                      circle(true, '코스'),
                      circle(true, '나이키'),
                      circle(true, '아이앱 스튜디오'),
                      circle(false, '조던'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      circle(true, '애플'),
                      circle(true, '아미'),
                      circle(true, '아디다스'),
                      circle(true, '슈프림'),
                      circle(false, '뉴발란스'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      circle(true, '아크레틱스'),
                      circle(true, '살로몬'),
                      circle(true, '메종 키츠네'),
                      circle(true, '야스히로'),
                      circle(false, '더보기'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///배너
          Container(
            width: MediaQuery.of(context).size.width,
            height: 588.h,
            color: Colors.red,
            child: const Center(child: Text('사진')),
          ),

          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 42.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Most Popular Title
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Most Popular',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ),

                /// 인기 상품 Subtitle
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: const Text(
                    '인기 상품',
                    style: TextStyle(color: Color(0xFF919191)),
                  ),
                ),

                /// Clothes
                Padding(
                  padding: EdgeInsets.only(bottom: 44.h),
                  child: SizedBox(
                    height: 468.h,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: clothesList.length,
                      itemBuilder: (context, index) {
                        return Clothes(
                          title: clothesList[index]['title'],
                          product: clothesList[index]['product'],
                          content: clothesList[index]['content'],
                          tagNumber: clothesList[index]['tagNumber'],
                          tags: clothesList[index]['tags'],
                          discount: clothesList[index]['discount'],
                          price: clothesList[index]['price'],
                          purchase: clothesList[index]['purchase'],
                          icon: clothesList[index]['icon'],
                        );
                      },
                    ),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(bottom: 46.h),
                  child: Divider(height: 2.w),
                ),
                //
                /// 본격 가을맞이! 추천 스니커즈 Title
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    '본격 가을맞이! 추천 스니커즈',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ),

                /// #웰컴어텀챌린지 Subtitle
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: const Text(
                    '#웰컴어텀챌린지',
                    style: TextStyle(color: Color(0xFF919191)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        picture(),
                        picture(),
                        picture(),
                        picture(),
                        picture(),
                        picture(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: Container(width: 648.w, height: 589.h, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// New In Title
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'New In',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ),

                /// 신규 등록 상품 Subtitle
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: const Text(
                    '신규 등록 상품',
                    style: TextStyle(color: Color(0xFF919191)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 44.h),
                  child: SizedBox(
                    height: 468.h,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: clothesList.length,
                      itemBuilder: (context, index) {
                        return Clothes(
                          title: clothesList[index]['title'],
                          product: clothesList[index]['product'],
                          content: clothesList[index]['content'],
                          tagNumber: clothesList[index]['tagNumber'],
                          tags: clothesList[index]['tags'],
                          discount: clothesList[index]['discount'],
                          price: clothesList[index]['price'],
                          purchase: clothesList[index]['purchase'],
                          icon: clothesList[index]['icon'],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: Container(width: 648.w, height: 589.h, color: Colors.red),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Timeless Sneakers Title
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Timeless Sneakers',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ),

                /// 가을에 더 신고 싶은 독일군 스니커즈 Subtitle
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: const Text(
                    '가을에 더 신고 싶은 독일군 스니커즈',
                    style: TextStyle(color: Color(0xFF919191)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 44.h),
                  child: SizedBox(
                    height: 468.h,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: clothesList.length,
                      itemBuilder: (context, index) {
                        return Clothes(
                          title: clothesList[index]['title'],
                          product: clothesList[index]['product'],
                          content: clothesList[index]['content'],
                          tagNumber: clothesList[index]['tagNumber'],
                          tags: clothesList[index]['tags'],
                          discount: clothesList[index]['discount'],
                          price: clothesList[index]['price'],
                          purchase: clothesList[index]['purchase'],
                          icon: clothesList[index]['icon'],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

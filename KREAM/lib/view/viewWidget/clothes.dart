// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kream/view/viewWidget/tag.dart';

class Clothes extends StatelessWidget {
  String title, product, content, price, purchase;
  int tagNumber;
  int? discount;
  List tags = List.empty(growable: true);
  bool icon;

  Clothes(
      {required this.title,
      required this.product,
      required this.content,
      required this.tagNumber,
      required this.tags,
      required this.discount,
      required this.price,
      required this.purchase,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Stack(
            children: [
              Container(
                width: 232.w,
                height: 230.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(child: Text('사진')),
              ),
              Padding(
                padding: EdgeInsets.only(left: 180.w, top: 170.h),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.turned_in_not_sharp),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, bottom: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///
                  icon == true
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.deepPurpleAccent,
                          size: 20.w,
                        )
                      : const Text(''),
                ],
              ),
              SizedBox(width: 228.w, child: Text(product)),
              //15
              SizedBox(
                width: 228.w,
                child: Text(content.length > 15
                    ? content.substring(0, 15) + '...'
                    : content),
              ),

              /// 태그들
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: SizedBox(
                  width: 232.w,
                  child: Row(
                    children: [
                      for (int index = 0; index < tagNumber; index++)
                        tag(tags[index]),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      discount != null ? '$discount%' : '',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: Text(
                        '$price원',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                purchase,
                style:
                    TextStyle(fontSize: 20.sp, color: const Color(0xFFA6A6A6)),
              )
            ],
          ),
        ),
      ],
    );
  }
}

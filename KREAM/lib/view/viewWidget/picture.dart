import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

picture() {
  return Padding(
    padding: EdgeInsets.only(right: 9.w),
    child: Stack(
      children: [
        Container(
          width: 210.w,
          height: 278.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFFA6A6A6),
          ),
          child: const Center(
            child: Text('사진'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 13.h, left: 13.w),
          child: Container(
            width: 56.w,
            height: 57.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0xFFD9D9D9),
            ),
            child: Center(
              child: Container(
                width: 51.w,
                height: 52.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: const Color(0xFF9F9F9F),
                ),
                child: Center(
                  child: Text('사진'),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

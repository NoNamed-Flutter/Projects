import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

circle(bool isPadding, String text) {
  if (isPadding) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110.w,
            height: 110.h,
            decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(110)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(110),
              child: Center(child: Text(text)),
            ),
          ),
          SizedBox(
            width: 110.w,
            child: Padding(
              padding: EdgeInsets.only(top: 13.h),
              child: Center(child: Text(text)),
            ),
          ),
        ],
      ),
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 110.w,
          height: 110.h,
          decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(110)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(110),
            child: Center(child: Text(text)),
          ),
        ),
        SizedBox(
          width: 110.w,
          child: Padding(
            padding: EdgeInsets.only(top: 13.h),
            child: Center(child: Text(text)),
          ),
        ),
      ],
    );
  }
}

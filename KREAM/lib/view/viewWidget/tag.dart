import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

tag(String text) {
  return Padding(
    padding: EdgeInsets.only(right: 6.w),
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(6.w, 5.w, 6.w, 5.w),
        child: Text(text),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteContentContainer extends StatelessWidget {
  final Widget child;
  final double topRadius;

  const WhiteContentContainer({
    super.key,
    required this.child,
    this.topRadius = 60, // Valeur par défaut
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(topRadius.r)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRadius.r),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

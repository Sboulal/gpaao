import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customcard extends StatelessWidget {
  final String nom;
  final String prenom;
  final String desc;
  final String image;

  const Customcard({
    super.key,
    required this.nom,
    required this.prenom,
    required this.desc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      elevation: 0,
      child: ListTile(
        isThreeLine: false,
        shape: Border(
          bottom: BorderSide(color: Color(0xFF2968c0), width: 0.5.w),
        ),
        leading: Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF0e1763), width: 1.w),
          ),
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(image),
          ),
        ),
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: ' $prenom',

                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: " ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: nom.toUpperCase(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0e1763),
                ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          desc,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 12.sp,

            fontWeight: FontWeight.w300,
            color: Color.fromARGB(255, 25, 25, 25),
          ),
        ),
      ),
    );
  }
}

/*String customFormat(String text) {
  if (text.isEmpty) return text;
  if (text.length == 1) return text.toUpperCase();

  return text[0].toUpperCase() +
      text[1].toLowerCase() +
      text.substring(2).toUpperCase();
}*/

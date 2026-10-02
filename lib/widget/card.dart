import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomcardGroup extends StatelessWidget {
  final String nom;
  final String? prenom;

  const CustomcardGroup({super.key, required this.nom, this.prenom});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      semanticContainer: true,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      elevation: 0,
      child: ListTile(
        shape: Border(
          bottom: BorderSide(color: Color(0xFF2968c0), width: 0.75),
        ),
        leading: Image(
          image: AssetImage("assets/icons/user.png"),
          width: 20.w,
          height: 20.h,
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Dr",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: prenom != null ? ' $prenom' : '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: " ",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: nom.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0e1763),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

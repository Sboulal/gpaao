import 'package:amfrom_app/widget/app_header.dart';
import 'package:amfrom_app/widget/white_content_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Editorial extends StatefulWidget {
  const Editorial({super.key});

  @override
  State<Editorial> createState() => _EditorialState();
}

class _EditorialState extends State<Editorial> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EditorialText();
  }
}

class EditorialText extends StatelessWidget {
  const EditorialText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0e1763),
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: "EDITORIAL", assetGif: 'assets/icons/2.gif'),
            WhiteContentContainer(
              topRadius: 60,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF0e1763),
                                width: 2.w,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30.r,
                              backgroundColor: Colors.white,
                              backgroundImage: const AssetImage(
                                'assets/groupe/1.jpg',
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 19),
                                    children: [
                                      const TextSpan(
                                        text: "Pr Hassan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromARGB(
                                            255,
                                            30,
                                            30,
                                            30,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: " ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "ERRIHANI ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xFF0e1763),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                /*Text(
                                  "Professeur ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11.sp,
                                    color: Color.fromARGB(255, 67, 67, 67),
                                  ),
                                ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "zain",
                            fontSize: 17.sp,
                            height: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "C’est avec une immense fierté que le Département d’Oncologie Médicale de l’Institut ",
                            ),
                            TextSpan(
                              text:
                                  "National d’Oncologie présente la première édition du Guide pratique d’administration des ",
                            ),
                            TextSpan(text: "médicaments anticancéreux."),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "zain",
                            fontSize: 17.sp,
                            height: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "Ce guide est le fruit d’un travail collégial d’envergure, mené avec rigueur et dévouement au ",
                            ),
                            TextSpan(
                              text:
                                  "fil de plusieurs années. Il a mobilisé l’ensemble des compétences et de l’expertise de nos ",
                            ),
                            TextSpan(
                              text:
                                  "oncologues médicaux, animés par une même ambition : offrir un outil de référence fiable, ",
                            ),
                            TextSpan(
                              text:
                                  "cohérent et adapté aux besoins de la pratique oncologique au Maroc. ",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "zain",
                            fontSize: 17.sp,
                            height: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "Au-delà de sa dimension pratique, ce guide revêt une portée stratégique. Il constitue ",
                            ),
                            TextSpan(
                              text:
                                  "en effet le socle scientifique et médical sur lequel s’est appuyée l’informatisation et la ",
                            ),
                            TextSpan(
                              text:
                                  "digitalisation des protocoles thérapeutiques. Il représente aujourd’hui une référence ",
                            ),

                            TextSpan(
                              text:
                                  "nationale pour la prescription et l’administration des traitements anticancéreux, utilisée ",
                            ),
                            TextSpan(
                              text:
                                  "tant au sein de notre institut que dans de nombreux centres publics et privés à travers le pays.",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "zain",
                            fontSize: 17.sp,
                            height: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "Je tiens à saluer, avec une profonde reconnaissance, l’ensemble des oncologues médicaux, ",
                            ),
                            TextSpan(
                              text:
                                  "anciens et actuels, qui ont contribué à cette réalisation. Leur engagement, leur persévérance ",
                            ),
                            TextSpan(
                              text:
                                  "et leur sens du devoir ont permis de concrétiser un projet ambitieux, au service de la qualité ",
                            ),

                            TextSpan(
                              text:
                                  "et de la sécurité des soins en oncologie. Grâce à leur dévouement, ce guide a pu voir le jour ",
                            ),
                            TextSpan(
                              text:
                                  "un guide utile, pertinent et pleinement ancré dans le contexte national.",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "zain",
                            fontSize: 17.sp,
                            height: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "Enfin, nous nous engageons à assurer une mise à jour annuelle de ce guide, afin qu’il ",
                            ),
                            TextSpan(
                              text:
                                  "demeure en phase avec les évolutions scientifiques, thérapeutiques et technologiques ",
                            ),
                            TextSpan(
                              text:
                                  "dans le domaine de l’oncologie. Rendez-vous donc chaque année pour une nouvelle ",
                            ),

                            TextSpan(
                              text:
                                  "édition enrichie, au service d’une meilleure prise en charge des patients atteints de cancer au Maroc.",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                    ],
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

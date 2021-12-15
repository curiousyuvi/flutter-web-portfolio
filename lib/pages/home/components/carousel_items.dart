import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/utils/constants.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   "FLUTTER DEVELOPER",
          //   style: GoogleFonts.oswald(
          //     color: kPrimaryColor,
          //     fontWeight: FontWeight.w900,
          //     fontSize: 16.0,
          //   ),
          // ),
          Container(
            height: 20,
            child: AnimatedTextKit(
                repeatForever: true,
                pause: Duration(milliseconds: 700),
                animatedTexts: [
                  TyperAnimatedText(
                    "FLUTTER DEVELOPER",
                    textAlign: TextAlign.start,
                    curve: Curves.easeInOut,
                    speed: Duration(milliseconds: 100),
                    textStyle: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                  TyperAnimatedText(
                    "GRAPHIC DESIGNER",
                    textAlign: TextAlign.start,
                    curve: Curves.easeInOut,
                    speed: Duration(milliseconds: 100),
                    textStyle: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                  TyperAnimatedText(
                    "TECHNICAL WRITER",
                    textAlign: TextAlign.start,
                    curve: Curves.easeInOut,
                    speed: Duration(milliseconds: 100),
                    textStyle: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                  TyperAnimatedText(
                    "COMPETITIVE PROGRAMMER",
                    textAlign: TextAlign.start,
                    curve: Curves.easeInOut,
                    speed: Duration(milliseconds: 100),
                    textStyle: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                  // RotateAnimatedText(
                  //   "GRAPHIC DESIGNER",
                  //   textAlign: TextAlign.start,
                  //   duration: Duration(seconds: 4),
                  //   alignment: Alignment.centerLeft,
                  //   textStyle: GoogleFonts.oswald(
                  //     color: kPrimaryColor,
                  //     fontWeight: FontWeight.w900,
                  //     fontSize: 16.0,
                  //   ),
                  // ),
                  // RotateAnimatedText(
                  //   "TECHNICAL WRITER",
                  //   textAlign: TextAlign.start,
                  //   duration: Duration(seconds: 4),
                  //   alignment: Alignment.centerLeft,
                  //   textStyle: GoogleFonts.oswald(
                  //     color: kPrimaryColor,
                  //     fontWeight: FontWeight.w900,
                  //     fontSize: 16.0,
                  //   ),
                  // ),
                  // RotateAnimatedText(
                  //   "COMPETITIVE PROGRAMMER",
                  //   textAlign: TextAlign.start,
                  //   duration: Duration(seconds: 4),
                  //   alignment: Alignment.centerLeft,
                  //   textStyle: GoogleFonts.oswald(
                  //     color: kPrimaryColor,
                  //     fontWeight: FontWeight.w900,
                  //     fontSize: 16.0,
                  //   ),
                  // ),
                ]),
          ),
          SizedBox(
            height: 18.0,
          ),
          SelectableText(
            "YUVRAJ\nSINGH",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SelectableText(
            "Full-stack App developer, based in India",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 15.0,
              height: 1.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Wrap(
              children: [
                SelectableText(
                  "Wanna tak about tech?I'm all ears",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          // MouseRegion(
          //   cursor: SystemMouseCursors.click,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: kPrimaryColor,
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //     height: 48.0,
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 28.0,
          //     ),
          //     child: TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         "GET STARTED",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 13.0,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    ),
    image: Container(
      child: Image.asset(
        "assets/person.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);

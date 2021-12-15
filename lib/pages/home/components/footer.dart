import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/onHover.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<FooterItem> footerItems = [
  FooterItem(
      iconPath: "assets/email.png",
      title: "/ysgaur9919@gmail.com",
      url:
          "https://mail.google.com/mail/?view=cm&fs=1&to=ysgaur9919@gmail.com"),
  FooterItem(
      iconPath: "assets/github.png",
      title: "/curiousyuvi",
      url: "https://github.com/curiousyuvi"),
  FooterItem(
      iconPath: "assets/linkedin.png",
      title: "/linkedin",
      url: "https://www.linkedin.com/in/yuvraj-singh-b85ab71b9/"),
  FooterItem(
      iconPath: "assets/instagram.png",
      title: "/curiousyuvi",
      url: "https://www.instagram.com/curiousyuvi/"),
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CONNECT WITH ME",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: OnHover(
                            builder: (isHovered) {
                              return GestureDetector(
                                onTap: () {
                                  window.open(footerItem.url, "_blank");
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: isHovered
                                            ? kPrimaryColor.withOpacity(0.2)
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                footerItem.iconPath,
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 2.0,
                                              ),
                                              Text(
                                                footerItem.title,
                                                style: GoogleFonts.oswald(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Made with ",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          FlutterIcons.hearto_ant,
                          color: Colors.pink,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          " in Flutter",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}

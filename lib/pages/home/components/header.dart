import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/header_item.dart';
import 'package:web_portfolio/providers/scroll_position_provider.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "HOME",
    index: 0,
  ),
  HeaderItem(
    title: "PROJECTS",
    index: 1,
  ),
  HeaderItem(
    title: "EDUCATION",
    index: 2,
  ),
  HeaderItem(
    title: "CONNECT",
    index: 3,
  ),
  HeaderItem(
    title: "RESUME",
    index: 4,
    isButton: true,
  )
];

class HeaderLogo extends StatelessWidget {
  Function() onTap;
  HeaderLogo({this.onTap});
  @override
  Widget build(BuildContext context) {
    var scrollPositionProvider =
        Provider.of<ScrollPositionProvider>(context, listen: true);

    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: scrollPositionProvider.getIsScrolledToTop()
                      ? "CURIOUSYUVI"
                      : "CY",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  List<Function()> listOhHeaderFunctions;
  HeaderRow({this.listOhHeaderFunctions});
  @override
  Widget build(BuildContext context) {
    print('header items length : ' + listOhHeaderFunctions.length.toString());
    var scrollPositionProvider =
        Provider.of<ScrollPositionProvider>(context, listen: false);

    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: listOhHeaderFunctions[item.index],
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: listOhHeaderFunctions[item.index],
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  List<Function()> listOfHeaderFunctions;
  Header({this.listOfHeaderFunctions});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(listOfHeaderFunctions),
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(listOfHeaderFunctions),
        tablet: buildHeader(listOfHeaderFunctions),
      ),
    );
  }

  // mobile header
  Widget buildMobileHeader(listOfHeaderFunction) {
    print('mobile header built');
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(
              onTap: listOfHeaderFunctions[0],
            ),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState.openEndDrawer();
              },
              child: Icon(
                FlutterIcons.menu_fea,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(listOfHeaderFunctions) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(
            onTap: listOfHeaderFunctions[0],
          ),
          HeaderRow(listOhHeaderFunctions: listOfHeaderFunctions),
        ],
      ),
    );
  }
}

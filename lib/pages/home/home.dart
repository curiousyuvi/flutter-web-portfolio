import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/projects.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/sponsors.dart';
import 'package:web_portfolio/pages/home/components/testimonial_widget.dart';
import 'package:web_portfolio/pages/home/components/website_ad.dart';
import 'package:web_portfolio/providers/scroll_position_provider.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();

  List<Function()> listOfHeaderFunction;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOfHeaderFunction = [
      () {
        print('Scroll To called to home');

        if (_scrollController.hasClients)
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      },
      () {
        print('Scroll To called to project');

        if (_scrollController.hasClients)
          _scrollController.animateTo(900,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      },
      () {
        print('Scroll To called to education');

        if (_scrollController.hasClients)
          _scrollController.animateTo(1400,
              duration: Duration(milliseconds: 700), curve: Curves.easeInOut);
      },
      () {
        print('Scroll To called to connect');
        if (_scrollController.hasClients)
          _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut);
      },
      () {
        window.open(
            "https://drive.google.com/file/d/1waoGwkjHHfHi5ek86RzR0Zg5ggcwjzFk/view",
            "_blank");
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    var scrollPositionProvider =
        Provider.of<ScrollPositionProvider>(context, listen: false);

    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(),
        backgroundColor: kBackgroundColor,
        title: Header(
          listOfHeaderFunctions: listOfHeaderFunction,
        ),
        leadingWidth: 0,
        actions: [Container()],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: listOfHeaderFunction[index],
                            child: Text(
                              headerItems[index].title,
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
                        child: ListTile(
                          onTap: listOfHeaderFunction[index],
                          title: Text(
                            headerItems[index].title,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            scrollPositionProvider.updateFlag(notification.metrics.pixels == 0);
            return true;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Carousel(),
                SizedBox(
                  height: 20.0,
                ),
                CvSection(),
                Projects(),
                SizedBox(
                  height: 80.0,
                ),
                EducationSection(),
                SizedBox(
                  height: 70.0,
                ),
                SkillSection(),
                SizedBox(
                  height: 100.0,
                ),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

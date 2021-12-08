// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:solarvox/app/modules/projects_engineering/view/projects_%20engineering_page.dart';
import 'package:solarvox/app/shared/utils/content_view.dart';
import 'package:solarvox/app/shared/utils/tab_controller_handler.dart';
import 'package:solarvox/app/shared/utils/view_wrapper.dart';
import 'package:solarvox/app/shared/views/home_view.dart';
import 'package:solarvox/app/shared/views/projects_view.dart';
import 'package:solarvox/app/shared/widgets/bottom_bar.dart';
import 'package:solarvox/app/shared/widgets/custom_tab.dart';
import 'package:solarvox/app/shared/widgets/custom_tab_bar.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  List<ContentView> contentViews = [
    ContentView(
        tab: const CustomTab(
          title: 'Home',
          link: 'teste0',
        ),
        content: const HomeView(),
        link: '/a'),
    ContentView(
      tab: const CustomTab(
        title: 'Projetos/Engenharia',
        link: '/projects_engineering',
      ),
      link: '/projects_engineering',
      content: ProjectsEngineeringPage(),
    ),
    ContentView(
      link: '/a',
      tab: const CustomTab(
        title: 'Projetos/Orçamentos',
        link: 'teste2',
      ),
      content: const ProjectsView(),
    ),
    ContentView(
      link: '/a',
      tab: const CustomTab(
        title: 'Clientes',
        link: 'teste3',
      ),
      content: const ProjectsView(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.00;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      endDrawer: drawer(),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:
            ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Tab Bar
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE2E2E2),
              border: Border.all(
                color: const Color(0xFFE2E2E2),
              ),
            ),
            height: screenHeight * 0.1,
            child: CustomTabBar(
                controller: tabController,
                tabs: contentViews.map((e) => e.tab).toList()),
          ),
        ),

        /// Tab Bar View
        Container(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),

        /// Bottom Bar
        const BottomBar()
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: Container(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                iconSize: screenWidth * 0.08,
                icon: const Icon(Icons.menu_rounded),
                color: Colors.black,
                splashColor: Colors.transparent,
                onPressed: () => scaffoldKey.currentState!.openEndDrawer()),
            // Expanded(
            //   child: ScrollablePositionedList.builder(
            //     scrollDirection: Axis.vertical,
            //     itemScrollController: itemScrollController,
            //     itemCount: contentViews.length,
            //     itemBuilder: (context, index) => contentViews[index].content,
            //   ),
            // )
            const HomeView()
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Container(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: [Container(height: screenHeight * 0.1)] +
              contentViews
                  // ignore: avoid_unnecessary_containers
                  .map((e) => Container(
                        child: ListTile(
                          title: Text(
                            e.tab.link,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onTap: () {
                            // itemScrollController.scrollTo(
                            //     index: contentViews.indexOf(e),
                            //     duration: Duration(milliseconds: 300));
                            // Navigator.pop(context);

                            Modular.to.pushNamed(
                              '/projects_engineering',
                            );
                          },
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}

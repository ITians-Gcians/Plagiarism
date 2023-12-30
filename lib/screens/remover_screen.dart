import 'package:flutter/material.dart';

import '../screens/word_changer_screen.dart';

import '../screens/ai_screen.dart';

import '../utils/Strings.dart';
import '../utils/color.dart';
import '../utils/images.dart';
import '../Widgets/tabs.dart';

enum RemoverTab { AI, WordChanger }

class RemoverScreen extends StatefulWidget {
  const RemoverScreen({super.key});
  @override
  _RemoverScreenState createState() => _RemoverScreenState();
}

class _RemoverScreenState extends State<RemoverScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  RemoverTab _currentTab = RemoverTab.AI;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _currentTab =
          _tabController.index == 0 ? RemoverTab.AI : RemoverTab.WordChanger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: Container(
            padding: EdgeInsets.all(15.0),
            child: Image.asset(
              Images.logo,
            ),
          ),
          title: Text(
            Strings.plagiarismTitle,
            // style: Style.PlagiarismTitleStlyle,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Container(
              color: CustomColors.PRIMECOLOR,
              child: TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.symmetric(horizontal: 16),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
                indicatorWeight: 3.0,
                labelColor: Colors.black,
                indicatorColor: const Color.fromARGB(236, 0, 0, 0),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tabs(
                      selectedTabIndex: _currentTab == RemoverTab.AI,
                      text: 'AI',
                      imagePath: Images.remover,
                      tabIndex: 0),
                  Tabs(
                      selectedTabIndex: _currentTab == RemoverTab.WordChanger,
                      text: 'Words Changer',
                      imagePath: Images.changer,
                      tabIndex: 1),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [AIScreen(), WordChangerScreen()],
        ),
      ),
    );
  }
}

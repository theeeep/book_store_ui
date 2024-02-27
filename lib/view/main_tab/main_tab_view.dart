import 'package:book_store_ui/common/color_extention.dart';
import 'package:book_store_ui/view/account/account_view.dart';
import 'package:book_store_ui/view/home/home_view.dart';
import 'package:book_store_ui/view/our_books/our_books_view.dart';
import 'package:book_store_ui/view/search/search_view.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.7,
        child: Container(
          decoration: BoxDecoration(
              color: TColor.dColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(media.width * 0.6),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.greenAccent, blurRadius: 15),
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuArr.map((mObj) {
                    var index = menuArr.indexOf(mObj);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      decoration: selectMenu == index
                          ? BoxDecoration(
                              color: TColor.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: TColor.primary,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                            )
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OurBooksView()));
                            sideMenuScaffoldKey.currentState?.closeEndDrawer();
                          } else if (index == 7) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccountView()));
                            sideMenuScaffoldKey.currentState?.closeEndDrawer();
                          }
                          setState(() {
                            selectMenu = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              mObj["name"].toString(),
                              style: TextStyle(
                                color: selectMenu == index
                                    ? Colors.white
                                    : TColor.text,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Icon(mObj["icon"] as IconData? ?? Icons.home,
                                color: selectMenu == index
                                    ? Colors.white
                                    : TColor.primary,
                                size: 33),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: TColor.subTitle,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const HomeView(),
          const SearchView(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(bottom: 0),
        color: TColor.primary,
        child: TabBar(
          controller: controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: const [
            Tab(
              icon: Icon(Icons.home_outlined),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.favorite_border),
              text: "Wishlist",
            ),
            Tab(
              icon: Icon(Icons.shopping_cart_checkout),
              text: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}

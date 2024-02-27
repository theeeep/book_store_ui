import 'package:book_store_ui/common/color_extention.dart';
import 'package:book_store_ui/common_widgets/best_seller_cell.dart';
import 'package:book_store_ui/common_widgets/genres_cell.dart';
import 'package:book_store_ui/common_widgets/recently_cell.dart';
import 'package:book_store_ui/common_widgets/round_button.dart';
import 'package:book_store_ui/common_widgets/round_textfield.dart';
import 'package:book_store_ui/common_widgets/top_picks_cell.dart';
import 'package:book_store_ui/view/book_reading/book_reading_view.dart';
import 'package:book_store_ui/view/login/sign_up_view.dart';
import 'package:book_store_ui/view/main_tab/main_tab_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  List topPickerAr = [
    {
      "name": "The Dissapearance of Emile Zola",
      "author": "Micheal Rosen",
      "img": "assets/img/1.jpg"
    },
    {
      "name": "Fatherhood",
      "author": "Marcus Berkmann",
      "img": "assets/img/2.jpg"
    },
    {
      "name": "The Time Travellers Handbook",
      "author": "Stride Lottie",
      "img": "assets/img/3.jpg"
    },
  ];
  List bestArr = [
    {
      "name": "Fatherhood",
      "author": "by Christopher Wilson",
      "img": "assets/img/4.jpg",
      "rating": 5.0
    },
    {
      "name": "In A Land Of Paper Gods",
      "author": "by Rebecca Mackenzie",
      "img": "assets/img/5.jpg",
      "rating": 4.0
    },
    {
      "name": "Tattletale",
      "author": "by Sarah J. Noughton",
      "img": "assets/img/6.jpg",
      "rating": 3.0
    }
  ];

  List genresArr = [
    {
      "name": "Graphic Novels",
      "img": "assets/img/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/g1.png",
    }
  ];

  List recentArr = [
    {
      "name": "The Fatal Tree",
      "author": "by Jake Arnott",
      "img": "assets/img/10.jpg"
    },
    {
      "name": "Day Four",
      "author": "by LOTZ, SARAH",
      "img": "assets/img/11.jpg"
    },
    {
      "name": "Door to Door",
      "author": "by Edward Humes",
      "img": "assets/img/12.jpg"
    }
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius:
                              BorderRadius.circular(media.width * 0.5)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Row(
                        children: [
                          Text(
                            "Our Top Picks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                          onPressed: () {
                            sideMenuScaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPickerAr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPickerAr[itemIndex] as Map? ?? {};
                          return TopPicksCell(iObj: iObj);
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Best Sellers",
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                        itemCount: bestArr.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var bObj = bestArr[index] as Map? ?? {};
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookReadingView(
                                            bObj: bObj,
                                          )));
                            },
                            child: BestSellerCell(bObj: bObj),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Genres",
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.6,
                      child: ListView.builder(
                        itemCount: genresArr.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var bObj = genresArr[index] as Map? ?? {};
                          return GenresCell(
                            bObj: bObj,
                            bgColor:
                                index % 2 == 0 ? TColor.color1 : TColor.color2,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: media.width * 0.1),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Recently Viewed",
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.72,
                      child: ListView.builder(
                        itemCount: recentArr.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var bObj = recentArr[index] as Map? ?? {};
                          return RecentlyCell(bObj: bObj);
                        },
                      ),
                    ),
                    SizedBox(height: media.width * 0.1),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Monthly Newsletter",
                            style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: TColor.textbox.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Receive our monthly newsletter and receive on new stock, books and the occasional promotion.",
                            style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 15),
                          RoundTextField(
                            controller: txtName,
                            hintText: "Name",
                          ),
                          const SizedBox(height: 15),
                          RoundTextField(
                            controller: txtEmail,
                            hintText: "Email Address",
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MiniRoundButton(
                                  title: "Sign Up",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpView(),
                                      ),
                                    );
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: media.width * 0.1),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

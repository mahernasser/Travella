import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keframe/keframe.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../cubit/main_cubit.dart';
import '../data/data.dart';
import '../shared/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
    PageController pvController = PageController();
    int pvIndex = 0;
    return SideMenu(
      key: sideMenuKey,
      background: Theme.of(context).drawerTheme.backgroundColor,
      menu: drawerMenu(),
      type: SideMenuType.shrinkNSlide,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kimit Tours'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: IconButton(
                  icon: const Icon(
                    Icons.brightness_4,
                  ),
                  onPressed: () {
                    MainCubit.get(context).themeToggle();
                    MainCubit.get(context).scaffoldChange();
                  },
                )),
          ],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.filter_list_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              final state = sideMenuKey.currentState;
              if (state!.isOpened) {
                state.closeSideMenu();
              } else {
                state.openSideMenu();
              }
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(MainCubit.get(context).scaffoldImg),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    CarouselSlider(
                        items: [
                          Stack(
                            children: [
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/banner1.jpg'),
                                      ))),
                              Positioned(
                                top: 10,
                                left: -20,
                                child: Transform.rotate(
                                  angle: -40 / 180 * pi,
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    child: const Text(
                                      '25% Off',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontFamily: 'oxygen'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/2banner.jpg'),
                                      ))),
                              Positioned(
                                top: 10,
                                left: -20,
                                child: Transform.rotate(
                                  angle: -40 / 180 * pi,
                                  child: Container(
                                    child: const Text(
                                      '40% Off',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontFamily: 'oxygen'),
                                      textAlign: TextAlign.center,
                                    ),
                                    width: 100,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/3banner.jpg'),
                                      ))),
                              Positioned(
                                top: 10,
                                left: -20,
                                child: Transform.rotate(
                                  angle: -40 / 180 * pi,
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    child: const Text(
                                      '20% Off',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontFamily: 'oxygen'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/banner3.jpg'),
                                      ))),
                              Positioned(
                                top: 10,
                                left: -20,
                                child: Transform.rotate(
                                  angle: -40 / 180 * pi,
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    child: const Text(
                                      '20% Off',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontFamily: 'oxygen'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: MediaQuery.of(context).size.height * .23,
                          viewportFraction: 1,
                          initialPage: 1,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          reverse: false,
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    titleBuilder('Categories', context),
                    SizedBox(
                      height: 45,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: catList.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          return catItem(onTap: () {}, model: catList[index]);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    titleBuilder('Most Popular Places', context),
                    SizedBox(
                      height: 208,
                      width: double.infinity,
                      child: SizeCacheWidget(
                        estimateCount: 20,
                        child: ListView.separated(
                          cacheExtent: 500,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: popularList.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FrameSeparateWidget(
                                index: index,
                                child:
                                    popularItem(popularList[index], context));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    titleBuilder('Recommended Trips', context),
                    SizedBox(
                      height: 312,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PageView.builder(
                            onPageChanged: (index) {
                              pvIndex = index;
                            },
                            itemCount: tripList.length,
                            itemBuilder: (context, index) {
                              return tripCard(
                                  tripModel: tripList[index], context: context);
                            },
                            controller: pvController,
                            scrollDirection: Axis.horizontal,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  pvController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.slowMiddle);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.orange,
                                  size: 25,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  pvController.nextPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.slowMiddle);
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orange,
                                  size: 25,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
